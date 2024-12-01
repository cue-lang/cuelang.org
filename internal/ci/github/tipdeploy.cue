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

// tipdeploy is responsible for publishing a new version of tip.cuelang.org.
//
// Much of this workflow follows the steps in the trybot workflow.
workflows: tipdeploy: _repo.bashWorkflow & {
	name: "tip deploy"

	on: {
		// Allow this workflow to run in response to a new commit at the tip of
		// this repo. We also allow a tip deploy to be triggered from a push to
		// ci/test to help with testing CLs.
		push: branches: list.Concat([[_repo.testDefaultBranch], _repo.protectedBranchPatterns]) // do not run PR branches

		// Allow this workflow to run in response to a workflow_dispatch event,
		// specifically the event of a new commit at the tip of CUE needs to
		// trigger a new tip deploy.
		workflow_dispatch: {}
	}

	jobs: test: {
		"runs-on": _repo.linuxMachine

		// We only want to run this workflow in the main repo
		if: "github.repository == '\(_repo.githubRepositoryPath)' && (github.ref == 'refs/heads/\(_repo.defaultBranch)' || \(_repo.isTestDefaultBranch))"

		// We limit this workflow to run with parallelism of 1. This should
		// prevent us hitting races that occur when multiple commits land "at the
		// same time" in the main CUE repo, each triggering a tip deploy.
		concurrency: {
			group: "tip deploy"
			// We do not set cancel-in-progress to true to avoid getting failure
			// messages for a cancel, per the following GitHub bug:
			//
			//     https://github.com/orgs/community/discussions/50725
			//
			"cancel-in-progress": false
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

			_setNoWriteCache,

			for v in _setupGoActionsCaches {v},

			_repo.earlyChecks,

			_contentLint,

			_cacheWarm,

			_porcuepineCueLogin,

			githubactions.#Step & {
				name: "Patch the site to be compatible with the tip of cue-lang/cue"
				run:  "_scripts/tipPatchApply.bash"
			},

			// npm install in hugo to allow serve test to pass which is run as
			// part of regenPostInfraChange.bash
			_npmInstall,

			{
				name: "Configure the site to use the tip of cue-lang/cue"

				// Force Go to bypass the module proxy and sumdb for the
				// cuelang.org/go module, ensuring that the absolute latest CUE
				// pseudo-version is available to test against.
				//
				// TODO: is the use of GOPRIVATE (as opposed to GONOPROXY) really
				// necessary? Tracking https://golang.org/issue/70042 to confirm.
				env: GOPRIVATE: "cuelang.org/go"

				run: "_scripts/tipUseAlternativeCUE.bash"
			},

			{
				name: "Build the site against the tip of cue-lang/cue"
				run:  "_scripts/regenPostInfraChange.bash"

				// TODO: See comment in previous step
				env: GOPRIVATE: "cuelang.org/go"
			},

			{
				name: "Deploy the site"
				run:  """
				git config http.https://github.com/.extraheader "AUTHORIZATION: basic $(echo -n \(_repo.botGitHubUser):${{ secrets.\(_repo.botGitHubUserTokenSecretsKey) }} | base64)"
				_scripts/tipDeploy.bash '\(_repo.botGitHubUser)' '\(_repo.botGitHubUserEmail)'
				"""

				// TODO: See comment in previous step
				env: GOPRIVATE: "cuelang.org/go"
			},
		]
	}
}
