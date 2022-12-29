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
//   - Project github.com/my/project defines at least two workflows: a trybot
//     workflow that should be run for each CL/PR, and a repository dispatch
//     workflow that is fired by running cmd/cueckoo runtrybot (see below).
//   - github.com/my/project is imported into GerritHub as
//     review.gerrithub.io/q/project:my/project. github.com/my/project is
//     now the mirror target of the GerritHub source of truth.
//   - github.com/my/project-trybot is established as the repository within
//     which CI runs for CLs against review.gerrithub.io/q/project:my/project.
//     This repository has no secrets and is basically an empty shell that
//     defines a placeholder for the trybot workflow.
//   - Developers with write access to github.com/my/project use cmd/cueckoo to
//     run trybots for CLs against review.gerrithub.io/q/project:my/project. This
//     pushes a build branch named trybot/$changeID/$revisionID to
//     github.com/my/project-trybot. This triggers the trybot workflow.
//   - Workflow events triggered by the running of the trybot workflow fire
//     webhook events. gerritstatusupdater is configured in
//     github.com/my/project-trybot as a consumer of those events.
//   - According to the configuration of gerritstatusupdater, those webhook
//     events are converted into status updates on the CL that corresponds to the
//     originating build branch (the Gerrit API works using the $changeID and
//     $revisionID). The name of the workflow is used in the status updates written
//     to Gerrit CLs.
//
// The only constraint that must be satisfied between github.com/my/project and
// github.com/my/project-trybot is that the latter must define empty/shell
// GitHub Actions workflows for the workflow that will run as part of the
// trybots.  Indeed it is currently a limitation that only one workflow can be
// triggered (this constraint comes about because gerritstatusupdater cannot
// multiplex events from multiple disconnected workflows). Such an empty shell
// would look something like this:
//
//	# .github/workfows/test.yml
//	name: Test
//	"on":
//	  push:
//	    branches:
//	      - 'ci/**'
//	jobs:
//	  start:
//	    runs-on: ubuntu-20.04
//	    defaults:
//	      run:
//	        shell: bash
//	    steps:
//	      - run: 'echo hello world'
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
	dryRun = os.Getenv(EnvDryRun) != ""
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

	// EnvDryRun can be set to a non-empty string to prevent any actual "writes"
	// happening to either GitHub and/or GerritHub.
	EnvDryRun = EnvPrefix + "DRYRUN"
)

const (
	// GitHub does not define constants for event action, status and conclusion
	// fields on workflow jobs and runs. Define some here.
	//
	// The status and conclusion values are shared between workflow runs and
	// jobs. This is not officially documented at
	// https://docs.github.com/en/developers/webhooks-and-events/webhooks/webhook-events-and-payloads,
	// but it's demonstrably so in practice... which is all we've got.

	eventActionRequested  = "requested"
	eventActionInProgress = "in_progress"
	eventActionCompleted  = "completed"

	workflowStatusInProgress = "in_progress"
	workflowStatusCompleted  = "completed"

	workflowConclusionSuccess = "success"
)

// A localContext represents the state we build up as we receive and handle
// events. We capture this as a struct to simply the logging of context as
// we progressively populate the state.
//
// Do not put anything sensitive in this struct. It might be logged.
type localContext struct {
	// DeliveryID is the ID associated with the webhook event
	// sent by GitHub.
	DeliveryID string

	// Repo is "{owner}/{Repo}" (not any URL, and not just the Repo name).
	Repo string `json:",omitempty"`

	// WorkflowRunID is the ID of the workflow run for which we either
	// receive an event directly or via one of its associated workflow jobs.
	WorkflowRunID *int64 `json:",omitempty"`

	// WorkflowJobID is the ID of the workflow job, if the event relates to
	// a workflow job. It is nil otherwise
	WorkflowJobID *int64 `json:",omitempty"`

	// WorkflowPath is the path to yaml file that defines the workflow
	// declaration behind the workflow run and its jobs.
	WorkflowPath string `json:",omitempty"`

	// HeadBranch is the branch for which a workflow is triggered.
	HeadBranch string `json:",omitempty"`

	// EventType is the type of the webhook event
	EventType string `json:",omitempty"`

	// EventAction is the webhook event action
	EventAction string `json:",omitempty"`

	// WorkflowStatus is the workflow run or job (defined by EventType)
	// status
	WorkflowStatus string `json:",omitempty"`

	// WorkflowConclusion is the workflow run or job (defined by EventType)
	// conclusion
	WorkflowConclusion string `json:",omitempty"`

	// ChangeID is the CL number of the associated CL
	ChangeID string `json:",omitempty"`

	// RevisionID is the commit of the associated CL corresponding to the
	// patchset under test
	RevisionID string `json:",omitempty"`

	// CL is the string representation of the number of the associated CL
	CL string `json:",omitempty"`

	// Patchset is the string representation of the patchset number of the
	// associated CL corresponding to the patchset under test
	Patchset string `json:",omitempty"`
}

func (c *localContext) setHeadBranch(b string) {
	c.HeadBranch = b

	// Establish changeID and revisionID from head branch. Note
	// the first part of the build branch is not significant
	// as far as gerritstatusupdater is concerned: it's simply
	// used to namespace build branches, but also for workflows
	// to conditionally run based on the first part.
	// The format is therefore:
	//
	//     $something/$changeID/$revisionID(/.*)
	//
	// We don't limit the branch to only be three parts so as to
	// allow for extending the format in some cases.
	headBranchParts := strings.Split(c.HeadBranch, "/")
	if len(headBranchParts) < 3 {
		panic(fmt.Errorf("head branch %q not in expected format", c.HeadBranch))
	}
	c.ChangeID, c.RevisionID = headBranchParts[1], headBranchParts[2]

	// Extended information may be set
	if len(headBranchParts) == 5 {
		c.CL, c.Patchset = headBranchParts[3], headBranchParts[4]
	}
}

// ServeHTTP is the implementation of the gerritstatusupdater serverless
// function.
func (fn Function) ServeHTTP(w http.ResponseWriter, r *http.Request) {

	var (
		// workflowName is the name of the workflow run behind the event
		workflowName string

		// msg is the human message on the Gerrit CL review
		msg string

		// result is set on the Gerrit CL review as a score.
		result *int
	)

	var c localContext
	c.DeliveryID = github.DeliveryID(r)

	// Set up simple logging that closes over certain variables
	if os.Getenv("NETLIFY") == "true" {
		log.SetFlags(0) // we get time information from Netlify
	}
	// We also get a unique prefix from Netlify, but build
	// a context-based prefix ourselves here too.
	log.SetPrefix("")
	logf := func(format string, args ...interface{}) {
		b, err := json.Marshal(c)
		if err != nil {
			panic(fmt.Errorf("failed to marshal context for log: %v", err))
		}
		args = append([]interface{}{b}, args...)
		log.Printf("%s: "+format, args...)
	}

	defer func() {
		switch err := recover(); err := err.(type) {
		case error:
			log.Printf("got an error: %v", err)
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

		c.Repo = *event.Repo.FullName
		c.WorkflowJobID = job.ID
		c.WorkflowRunID = job.RunID
		c.EventAction = event.GetAction()
		c.EventType = "workflow job"
		c.WorkflowConclusion = job.GetConclusion()
		c.WorkflowStatus = job.GetStatus()

		// We only care about jobs when they are in a completed state,
		// and then anything other than success is failure.
		if job.GetStatus() != workflowStatusCompleted || job.GetConclusion() == workflowConclusionSuccess {
			logf("nothing to do")
			return
		}

		ghclient, err := fn.buildGitHubClient(c.Repo)
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

		c.setHeadBranch(*wr.HeadBranch)

		// The workflowRun does not include information like path about the workflow
		// itself, so we need to get that too.
		wf, _, err := ghclient.Actions.GetWorkflowByID(ctx, *event.Repo.Owner.Login, *event.Repo.Name, *wr.WorkflowID)
		if err != nil {
			panic(fmt.Errorf("failed to get workflow for id %v: %w", github.Stringify(wr.WorkflowID), err))
		}
		c.WorkflowPath = *wf.Path
		workflowName = *wf.Name

		// Tidy up context
		cancel()

		msg = fmt.Sprintf("%s run job failed for %s; see %s for more details", workflowName, strings.Join(job.Labels, " "), *job.HTMLURL)
		result = github.Int(-1)
	case *github.WorkflowRunEvent:
		run := event.WorkflowRun

		c.Repo = *event.Repo.FullName
		c.WorkflowRunID = run.ID
		c.setHeadBranch(*run.HeadBranch)
		c.WorkflowPath = *event.Workflow.Path
		c.EventAction = event.GetAction()
		c.EventType = "workflow run"
		c.WorkflowConclusion = run.GetConclusion()
		c.WorkflowStatus = run.GetStatus()

		ghclient, err := fn.buildGitHubClient(c.Repo)
		if err != nil {
			panic(err)
		}
		workflowName = *event.Workflow.Name

		// We only care about the start of a workflow or its completion.
		//
		// TODO: GitHub report incorrect workflow status and conclusion (at
		// least) when a workflow has succeeded. Reported in support ticket
		// #1715417.
		//
		// The event action appears to be reliable, so we use that as a proxy for
		// workflow run status.
		//
		// From examples seen in the wild, when action event is completed and the
		// workflow run is a succeess, either:
		//
		// * workflow run status = in_progress and conclusion = null.
		// * workflow run status = completed and conclusion = success;
		//
		// The logic below therefore reflects a workaround for this bug.
		//
		// As a precaution against workflow (job|run) status and conclusion being
		// unexpected values, we use Get* methods when comparing against string
		// values to avoid potential nil pointer dereferences.
		//
		// When this bug is fixed, switch back to the workflow run status and
		// conclusion (including the default log case).
		switch ea := *event.Action; ea {
		case eventActionRequested:
			// A bug on top of a bug? The in_progress event action (and workflow
			// run status) only gets notified "some time" after the workflow run
			// has actually started. In on case, the notification came through 4
			// minutes after the first job had started. Indeed two jobs had
			// already completed by this stage. Hence We use the requested event
			// to roughly signal that things have started, even though all jobs
			// might still be queued.
			msg = fmt.Sprintf("Started %s run... see progress at %s", workflowName, *run.HTMLURL)

			// Log workflow run status and conclusion for information purposes (will
			// help to confirm when GitHub have fixed the state bug).
			logf("start of workflow run")
		case eventActionCompleted:
			// Best-efforts delete build branch regardless of conclusion because
			// this is the end of the workflow run. If this fails the worst that
			// will happen is that we build up old build branches. More important
			// though that we update the CL.
			if !dryRun {
				_, err := ghclient.Git.DeleteRef(context.Background(), path.Dir(c.Repo), path.Base(c.Repo), "heads/"+c.HeadBranch)
				if err != nil {
					logf("failed to delete branch: %v", err)
				}
			}

			// In case any jobs have done anything other that succeed, they will
			// already have reported to the CL. Otherwise, we only need to do
			// something in the case the workflow run has succeeded. Because of
			// the aforementioned GitHub bug we have a couple of definitions of
			// success. Expressed as a switch statement with fallthrough because
			// otherwise the logic inversion makes the buggy states harder to
			// understand.
			switch {
			case run.GetStatus() == workflowStatusInProgress && run.Conclusion == nil:
				// Given event action is completed, this is a known (buggy) state
				// for a successfuly workflow run.
				//
				// Fallthrough to mark CL as success.
			case run.GetStatus() == workflowStatusCompleted && run.GetConclusion() == workflowConclusionSuccess:
				// The proper workflow run state for a completed, successful
				// workflow run.
				//
				// Fallthrough to mark CL as success.
			default:
				// Given the current GitHub bug, no idea what combination of states
				// and conclusions we might see here. Log for information
				logf("nothing to do (workflow jobs already reported)")
				return
			}

			// Log workflow run status and conclusion for information purposes (will
			// help to confirm when GitHub have fixed the state bug).
			logf("end of workflow run")

			// success
			msg = fmt.Sprintf("%s run succeeded: %s", workflowName, *run.HTMLURL)
			result = github.Int(1)

		default:
			logf("ignoring")
			return
		}
	case *github.PingEvent:
		logf("ping event; ignoring")
		return
	default:
		panic(fmt.Errorf("unhandled event type %T", event))
	}

	// Build a GerritHub client
	client, err := fn.buildGerritHubClient(c.Repo, c.WorkflowPath)
	if err != nil {
		panic(err)
	}
	if client == nil {
		logf("no configuration specified for repo-workflowPath %q", envJoin(c.Repo, c.WorkflowPath, ""))
		return
	}

	ri := &gerrit.ReviewInput{
		Tag:     strings.ToLower(workflowName),
		Message: msg,
	}
	if result != nil {
		ri.Labels = map[string]string{
			workflowName + "-Result": strconv.Itoa(*result),
		}
	}

	// We only want to get the author's attention again if CI failed.
	// In the other two cases (saying we have started, or passing), we don't.
	if result == nil || *result == 1 {
		ri.IgnoreAutomaticAttentionSetRules = true
	}

	b, _ := json.MarshalIndent(ri, "", "  ")
	logf("gerrit.SetReview %s/%s with\n%s", changeID, revisionID, b)
	if !dryRun {
		if _, _, err := client.Changes.SetReview(changeID, revisionID, ri); err != nil {
			panic(fmt.Errorf("failed to update gerrit: %w", err))
		}
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
