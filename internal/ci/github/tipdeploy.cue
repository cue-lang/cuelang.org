// Copyright 2024 The CUE Authors
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

package github

import (
	"list"

	"github.com/cue-tmp/jsonschema-pub/exp1/githubactions"
)

workflows: tipdeploy: _repo.bashWorkflow & {
	name: "tip deploy"

	on: {
		push: branches: list.Concat([[_repo.testDefaultBranch], _repo.protectedBranchPatterns]) // do not run PR branches

		// Allow the trybots to run in response to a workflow_dispatch event.
		// One source of workflow_dispatch events is the daily_tip_check
		// workflow.
		workflow_dispatch: {
			// TODO: work out how to derive this "schema" from a CUE schema
			inputs: {
				scheduled: {
					description: "Whether a workflow_dispatch was itself the result of a scheduled dispatch"
					required:    true
					default:     "false" // this is a string type field
				}
			}
		}
	}

	jobs: test: {
		"runs-on": _repo.linuxMachine

		// We only want to run this workflow in the main repo
		if: "github.repository == '\(_repo.githubRepositoryPath)' && (github.ref == 'refs/heads/\(_repo.defaultBranch)' || \(_repo.isTestDefaultBranch))"

		concurrency: {
			group: "tip deploy"
			// We do not set this to avoid getting failure messages for a cancel.
			// "cancel-in-progress": true
		}

		steps: [
			for v in _repo.checkoutCode {v},

			for v in _installDockerMacOS {v},

			_installMacOSUtils,
			_setupBuildx,
			_installNode,
			for v in _installGo {v},
			_installHugoLinux,
			_installHugoMacOS,

			// If the commit under test contains the trailer
			// Preprocessor-No-Write-Cache: true, then set the
			// PREPROCESSOR_NOWRITECACHE env var to non-empty.
			githubactions.#Step & {
				name: "Set PREPROCESSOR_NOWRITECACHE if Preprocessor-No-Write-Cache: true"
				run: """
					if ./_scripts/noWriteCache.bash HEAD
					then
						echo 'Found Preprocessor-No-Write-Cache trailer'
						echo "PREPROCESSOR_NOWRITECACHE=true" >> $GITHUB_ENV
					fi

					"""
			},

			// cachePre must come after installing Node and Go, because the cache locations
			// are established by running each tool.
			for v in _setupGoActionsCaches {v},

			// Run these early checks after we have restored the Go caches,
			// as the checks are Go programs themselves.
			_repo.earlyChecks,

			githubactions.#Step & {
				name: "Perform early content checks"
				run:  "_scripts/contentLint.bash"
			},

			// This is the only step that needs to be given (read-only) access to the Central Registry.
			// TODO: adopt any more specific command coming from https://cuelang.org/issue/3512.
			// TODO: add cache dir to CI cache when it's visible via https://cuelang.org/issue/2838.
			githubactions.#Step & {
				name: "Populate CUE dependency cache"
				env: CUE_TOKEN: "${{ secrets.NOTCUECKOO_CUE_TOKEN }}"
				run: "_scripts/cacheWarm.bash"
			},

			// A number of pages that are part of cuelang.org require interacting
			// with the Central Registry. These pages require users with slightly
			// different access levels, in order to simulate (for example) private
			// modules, with some users granted access whilst others are denied.
			// The Central Registry has a special endpoint which generates access
			// tokens for a set of such test user IDs. Access to this endpoint is
			// sensitive, because in theory there is privilege escalation (even
			// though in reality the test user IDs are intentionally not used
			// for anything sensitive). As such, we use porcuepine (an account
			// that is controlled by CUE Labs who also run the Central
			// Registry) here in order to more carefully control in a CI
			// environment who has access to this endpoint.
			githubactions.#Step & {
				name: "log into the central registry as porcuepine"
				run:  "go run cuelang.org/go/cmd/cue login --token ${{ secrets.PORCUEPINE_CUE_TOKEN }}"
			},

			githubactions.#Step & {
				name: "tip.cuelang.org: Patch the site to be compatible with the tip of cue-lang/cue"
				run:  "_scripts/tipPatchApply.bash"
			},

			// npm install in hugo to allow serve test to pass
			githubactions.#Step & {
				run:                 "npm install"
				"working-directory": "hugo"
			},

			githubactions.#Step & {
				name: "tip.cuelang.org: Configure the site to use the tip of cue-lang/cue"
				// Only run in the main repo on the default branch or its designated test branch (i.e not CLs)
				// so that CLs aren't blocked by failures caused by unrelated changes.

				// Force Go to bypass the module proxy and sumdb for the
				// cuelang.org/go module, ensuring that the absolute latest CUE
				// pseudo-version is available to test against.
				//
				// TODO: is this really necessary? Tracking
				// https://golang.org/issue/70042 to confirm.
				env: GOPRIVATE: "cuelang.org/go"

				run: "_scripts/tipUseAlternativeCUE.bash"
			},
			githubactions.#Step & {
				name: "tip.cuelang.org: Build the site against the tip of cue-lang/cue"
				// Only run in the main repo on the default branch or its designated test branch (i.e not CLs)
				// so that CLs aren't blocked by failures caused by unrelated changes.
				run: "_scripts/regenPostInfraChange.bash"

				// TODO: See comment in previous step
				env: GOPRIVATE: "cuelang.org/go"
			},
			githubactions.#Step & {
				name: "tip.cuelang.org: Deploy the site"
				// Only run in the main repo on the default branch or its designated test branch.
				run: """
				git config http.https://github.com/.extraheader "AUTHORIZATION: basic $(echo -n \(_repo.botGitHubUser):${{ secrets.\(_repo.botGitHubUserTokenSecretsKey) }} | base64)"
				_scripts/tipDeploy.bash '\(_repo.botGitHubUser)' '\(_repo.botGitHubUserEmail)'
				"""

				// TODO: See comment in previous step
				env: GOPRIVATE: "cuelang.org/go"
			},
		]
	}
}
