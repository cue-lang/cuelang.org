// Copyright 2022 CUE Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// package gerritstatusupdater defines a serverless function that updates
// Gerrit CLs in response to webhook callbacks from GitHub workflow events
// that fire in response to workflow runs in a GitHub repository.
//
// gerritstatusupdater works as follows (using the example of a trybot
// workflow):
//
// * Project github.com/my/project defines at least two workflows: a trybot
//   workflow that should be run for each CL/PR, and a repository dispatch
//   workflow that is fired by running cmd/cueckoo runtrybot (see below).
// * github.com/my/project is imported into GerritHub as
//   review.gerrithub.io/q/project:my/project. github.com/my/project is
//   now the mirror target of the GerritHub source of truth.
// * github.com/my/project-trybot is established as the repository within
//   which CI runs for CLs against review.gerrithub.io/q/project:my/project.
//   This repository has no secrets and is basically an empty shell that
//   defines a placeholder for the trybot workflow.
// * Developers with write access to github.com/my/project use cmd/cueckoo to
//   run trybots for CLs against review.gerrithub.io/q/project:my/project. This
//   pushes a build branch named trybot/$changeID/$revisionID to
//   github.com/my/project-trybot. This triggers the trybot workflow.
// * Workflow events triggered by the running of the trybot workflow fire
//   webhook events. gerritstatusupdater is configured in
//   github.com/my/project-trybot as a consumer of those events.
// * According to the configuration of gerritstatusupdater, those webhook
//   events are converted into status updates on the CL that corresponds to the
//   originating build branch (the Gerrit API works using the $changeID and
//   $revisionID). The name of the workflow is used in the status updates written
//   to Gerrit CLs.
//
// The only constraint that must be satisfied between github.com/my/project and
// github.com/my/project-trybot is that the latter must define empty/shell
// GitHub Actions workflows for the workflow that will run as part of the
// trybots.  Indeed it is currently a limitation that only one workflow can be
// triggered (this constraint comes about because gerritstatusupdater cannot
// multiplex events from multiple disconnected workflows). Such an empty shell
// would look something like this:
//
//    # .github/workfows/test.yml
//    name: Test
//    "on":
//      push:
//        branches:
//          - 'ci/**'
//    jobs:
//      start:
//        runs-on: ubuntu-20.04
//        defaults:
//          run:
//            shell: bash
//        steps:
//          - run: 'echo hello world'
//
// github.com/my/project would then have a workflow configuration such that
// for a trybot run, the .github/workfows/test.yml file in the pushed build
// branch would be run.
//
// gerritstatusupdater relies on a number of environment variables which are
// documented via the Env* constants in this package.
//
// In the future, this servless function could well become a GitHub App
// for convenience.
//
package gerritstatusupdater

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"path"
	"strconv"
	"strings"
	"time"

	"github.com/andygrunwald/go-gerrit"
	"github.com/google/go-github/v45/github"
	"golang.org/x/oauth2"
)

var (
	debug = os.Getenv(EnvDebug) != ""
)

// Function is a type which implements net/http.Handler, a handler which
// implements the serverless function for handling workflow webhook events
// and converting them into Gerrit reviews.
type Function struct {
	DevelopmentMode bool
}

const (
	// EnvPrefix is used to prefix environment variables used by
	// gerritstatusupdater. For repo-workflow-based values it is used in
	// conjunction with the env*Suffix variables that follow.
	//
	// Repo-based environment variable names are constructed via
	// buildRepoKey, where the repository name is the full_name derived
	// from the workflow run.
	//
	// Repo-workflow-based environment variable names are constructed via
	// buildRepoPathKey, where the repository name is the full_name derived from
	// the workflow run, and the path is derived from the workflow.
	EnvPrefix = "GERRITSTATUSUPDATER"

	// EnvGitHubPATSuffix is the suffix for the repo-based environment
	// variable that capture the GitHub access token to use when querying for
	// workflow run information in response to workflow job events. Note, this
	// variable is only repo-based: it does not make sense to configure this at
	// the workflow level (nor is it possible given the resolution of some
	// webhook events requires further calls to the GitHub API).
	EnvGitHubPATSuffix = "GITHUB_PAT"

	// EnvGerritHubInstanceSuffix is the suffix for the repo-workflow-based
	// environment variable that captures the GerritHub instance
	EnvGerritHubInstanceSuffix = "GERRITHUB_INSTANCE"

	// EnvGerritHubUsernameSuffix is the suffix for the repo-workflow-based
	// environment variable that captures the GerritHub username
	EnvGerritHubUsernameSuffix = "GERRITHUB_USERNAME"

	// EnvGerritHubPasswordSuffix is the suffix for the repo-workflow-based
	// environment variable that captures the GerritHub password associated with
	// the GerritHub username (see envGerritHubUsernameEnvSuffix).
	EnvGerritHubPasswordSuffix = "GERRITHUB_PASSWORD"

	// EnvWebhookSecret is the GitHub webhooks secret that is used to sign each
	// webhook event. The webhook secret is common to all repos because it is
	// effectively tied to the instance of gerritstatusupdater that runs,
	// and indeed it would be a security problem to parse the webook without
	// first validating it.
	EnvWebhookSecret = EnvPrefix + "WEBHOOK_SECRET"

	// EnvDebug prints debug information when set to something other than the
	// empty strying. This is useful when running this serverless function
	// locally. When EnvDebug is set, nothing is actually written to GerritHub,
	// instead the messages that would be sent to GerritHub are written to
	// stdout.
	EnvDebug = EnvPrefix + "DEBUG"
)

const (
	// GitHub does not define constants for status and conclusion fields
	// on workflow jobs and runs. Define some here.

	workflowStatusQueued      = "queued"
	workflowStatusCompleted   = "completed"
	workflowConclusionSuccess = "success"
)

// ServeHTTP is the implementation of the gerritstatusupdater serverless
// function.
func (fn Function) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	defer func() {
		switch err := recover(); err := err.(type) {
		case error:
			log.Printf("got an error: %v\n", err)
			http.Error(w, err.Error(), 500)
		case nil: // normal return
			// We currently see a whole load of errors in the GitHub webhook logs:
			//
			//    error decoding lambda response: invalid status code returned from lambda: 0
			//
			// However, these do not correspond to any errors in the Netlify function
			// logs.
			//
			// We use github.com/apex/gateway in order to reuse regular
			// net/http.HandleFunc handlers as part of the AWS Lambda setup. gateway is
			// therefore an adapter between net/http and AWS Lambda setup. However, it
			// appears that gateway to does not have any handling for a situation where
			// no HTTP status code is written. Currently, it appears that not writing
			// an HTTP status code as part of the net/http.HandleFunc handler results
			// in a 0 status code being return to the AWS Lambda handler. Contrast this
			// with the behaviour of regular net/http.ListenAndServe, which writes a
			// 200 in case no status code has been written.
			//
			// Fix this by simply writing a 200 status OK in case we return
			// successfully.
			w.WriteHeader(http.StatusOK)
		default:
			panic(err)
		}
	}()

	// The following variables will be populated based on the type of the webhook event

	// repo is "{owner}/{repo}" (not any URL, and not just the repo name)
	var repo string
	var workflowPath string
	var workflowName string
	var msg string
	var result *int
	var headBranch string

	// Validate the payload
	payload, err := github.ValidatePayload(r, []byte(os.Getenv(EnvWebhookSecret)))
	if err != nil {
		panic(fmt.Errorf("failed to validate webhook payload: %w", err))
	}
	r.Body.Close()

	// Parse the event and switch on the type
	event, err := github.ParseWebHook(github.WebHookType(r), payload)
	if err != nil {
		panic(fmt.Errorf("failed to parse webhook: %w", err))
	}
	switch event := event.(type) {
	case *github.WorkflowJobEvent:
		job := event.WorkflowJob

		// We only care about jobs when they are in a completed state,
		// and then anything other than success is failure.
		if *job.Status != workflowStatusCompleted || *job.Conclusion == workflowConclusionSuccess {
			return
		}

		repo = *event.Repo.FullName
		ghclient, err := fn.buildGitHubClient(repo)
		if err != nil {
			panic(err)
		}

		// Reuse context for the following two calls. Any errors will panic-out
		// in any case.
		ctx, cancel := context.WithTimeout(context.Background(), 60*time.Second)

		// The webhook payload does not include details about the workflow run
		// So we need to look this up with a call to GitHub
		wr, _, err := ghclient.Actions.GetWorkflowRunByID(ctx, *event.Repo.Owner.Login, *event.Repo.Name, *job.RunID)
		if err != nil {
			panic(fmt.Errorf("failed to get workflow run for id %v: %w", github.Stringify(job.RunID), err))
		}

		// The workflowRun does not include information like path about the workflow
		// itself, so we need to get that too.
		wf, _, err := ghclient.Actions.GetWorkflowByID(ctx, *event.Repo.Owner.Login, *event.Repo.Name, *wr.WorkflowID)
		if err != nil {
			panic(fmt.Errorf("failed to get workflow for id %v: %w", github.Stringify(wr.WorkflowID), err))
		}
		workflowPath = *wf.Path
		workflowName = *wf.Name

		// Tidy up context
		cancel()

		headBranch = *wr.HeadBranch
		msg = fmt.Sprintf("%s run job failed for %s; see %s for more details", workflowName, strings.Join(job.Labels, " "), *job.HTMLURL)
		result = github.Int(-1)
	case *github.WorkflowRunEvent:
		run := event.WorkflowRun

		repo = *event.Repo.FullName
		workflowPath = *event.Workflow.Path
		headBranch = *run.HeadBranch
		ghclient, err := fn.buildGitHubClient(repo)
		if err != nil {
			panic(err)
		}
		workflowName = *event.Workflow.Name

		// We only care about the start of a workflow or its success
		switch {
		case *run.Status == workflowStatusQueued:
			msg = fmt.Sprintf("Started %s run... see progress at %s", workflowName, *run.HTMLURL)
		case *run.Status == workflowStatusCompleted:
			// Best-efforts delete build branch regardless of conclusion because
			// this is the end of the workflow run. If this fails the worst that
			// will happen is that we build up old build branches. More important
			// though that we update the CL.
			if debug {
				log.Printf("deleting branch %q in repo %q\n", headBranch, repo)
			}
			ghclient.Git.DeleteRef(context.Background(), path.Dir(repo), path.Base(repo), "heads/"+headBranch)

			if *run.Conclusion != workflowConclusionSuccess {
				return
			}

			// success
			msg = fmt.Sprintf("%s run succeeded: %s", workflowName, *run.HTMLURL)
			result = github.Int(1)

		default:
			return
		}
	case *github.PingEvent:
		return
	default:
		panic(fmt.Errorf("unhandled event type %T", event))
	}

	// Build a GerritHub client
	client, err := fn.buildGerritHubClient(repo, workflowPath)
	if err != nil {
		panic(err)
	}
	if client == nil {
		if debug {
			log.Printf("no configuration specified for repo-workflowPath %q\n", envJoin(repo, workflowPath, ""))
		}
		return
	}

	// Establish changeID and revisionID from head branch. Note
	// the first part of the build branch is not significant
	// as far as gerritstatusupdater is concerned: it's simply
	// used to namespace build branches, but also for workflows
	// to conditionally run based on the first part.
	headBranchParts := strings.Split(headBranch, "/")
	if len(headBranchParts) != 3 {
		panic(fmt.Errorf("head branch %q not in expected format", headBranch))
	}
	changeID, revisionID := headBranchParts[1], headBranchParts[2]

	ri := &gerrit.ReviewInput{
		Tag:     strings.ToLower(workflowName),
		Message: msg,
	}
	if result != nil {
		ri.Labels = map[string]string{
			workflowName + "-Result": strconv.Itoa(*result),
		}
	}

	if !debug {
		if _, _, err := client.Changes.SetReview(changeID, revisionID, ri); err != nil {
			panic(fmt.Errorf("failed to update gerrit: %w", err))
		}
	} else {
		b, _ := json.MarshalIndent(ri, "", "  ")
		log.Printf("gerrit.SetReview %s/%s with\n%s\n", changeID, revisionID, b)
	}
}

// buildGitHubClient returns a GitHub client, deriving authentication for the
// given repo from the environment. If environment configuration cannot be
// found for repo, an error is returned (because in this case
// gerritstatusupdater should not be configured to listen to that repo).
func (fn Function) buildGitHubClient(repo string) (*github.Client, error) {
	// Lookup GitHub access token from the env of this repo
	githubPATKey := envJoin(repo, EnvGitHubPATSuffix)
	githubPAT := os.Getenv(githubPATKey)
	if githubPAT == "" {
		return nil, fmt.Errorf("empty GitHub access token for repo %q via %q", repo, githubPATKey)
	}

	// Build a GitHub client
	ts := oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: githubPAT},
	)
	tc := oauth2.NewClient(context.Background(), ts)
	return github.NewClient(tc), nil
}

// buildGerritHubClient returns a GerritHub client if there is environment
// configuration available for the supplied repo+workflowPath arguments,
// otherwise it returns nil. If there is an error in building the client, that
// error is returned.
func (fn Function) buildGerritHubClient(repo, workflowPath string) (*gerrit.Client, error) {
	// Lookup GerritHub instance from the env for this repo
	instanceKey := envJoin(repo, workflowPath, EnvGerritHubInstanceSuffix)
	instance := os.Getenv(instanceKey)
	if instance == "" {
		return nil, nil
	}

	// Lookup GerritHub username from the env for this repo
	usernameKey := envJoin(repo, workflowPath, EnvGerritHubUsernameSuffix)
	username := os.Getenv(usernameKey)
	if username == "" {
		return nil, nil
	}

	// Lookup GerritHub password from the env for this repo
	passwordKey := envJoin(repo, workflowPath, EnvGerritHubPasswordSuffix)
	password := os.Getenv(passwordKey)
	if password == "" {
		return nil, nil
	}

	// create GerritHub client
	client, err := gerrit.NewClient(instance, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to create GerritHub client: %w", err)
	}
	client.Authentication.SetBasicAuth(username, password)
	return client, nil
}

// envJoin creates an environment variable name from parts, adding EnvPrefix as
// a prefix as required.
func envJoin(parts ...string) string {
	parts = append([]string{EnvPrefix}, parts...)
	res := strings.Join(parts, "_")
	res = strings.ReplaceAll(res, ".", "_")
	res = strings.ReplaceAll(res, "-", "_")
	res = strings.ReplaceAll(res, "/", "_")
	return res
}
