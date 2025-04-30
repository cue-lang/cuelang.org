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
)

// tipdeploy is responsible for publishing a new version of tip.cuelang.org.
//
// Much of the "setup" phase of this workflow mimics and therefore reuses steps
// in the trybot workflow.
workflows: tipdeploy: _repo.bashWorkflow & {
	name: "tip deploy"

	on: {
		// Cause this workflow to run in response to a new commit at the tip of
		// this repo. We also allow a tip deploy to be triggered from a push to
		// ci/test to help with testing CLs.
		push: branches: list.Concat([[_repo.testDefaultBranch], _repo.protectedBranchPatterns]) // do not run PR branches

		// Cause this workflow to run in response to a workflow_dispatch event,
		// specifically the event of a new commit at the tip of CUE needs to
		// trigger a new tip deploy.
		workflow_dispatch: {}
	}

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

	jobs: test: {
		"runs-on": _repo.linuxMachine

		// We only want to run this workflow in the main repo
		if: "github.repository == '\(_repo.githubRepositoryPath)' && (github.ref == 'refs/heads/\(_repo.defaultBranch)' || \(_repo.isTestDefaultBranch))"

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

			// TODO: remove this debugging step when we work out what is going on
			// in the next step, why it is taking quite so long.
			{
				run: "go env"
			},

			// Run these early checks after we have restored the Go caches,
			// as the checks are Go programs themselves.
			_repo.earlyChecks & {
				run: "go run -x cuelang.org/go/internal/ci/checks@v0.11.0-0.dev.0.20240903133435-46fb300df650"
			},

			_contentLint,

			_cacheWarm,

			_porcuepineCueLogin,

			_applyTipPatches,

			// npm install in hugo to allow serve test to pass which is run as
			// part of regenPostInfraChange.bash. And we specifically want
			// npm install here, as opposed to npm ci, because we might have
			// patched things.
			{
				name:                "npm install in hugo"
				run:                 "npm install"
				"working-directory": "hugo"
			},

			_useTipOfCUE,

			_regenPostInfraChange,

			// Re-run the preprocessor to catch any pages whose content was updated
			// via assert directives
			{
				run: "./_scripts/runPreprocessor.bash execute"
			},

			_deployTipCuelangOrg,
		]
	}
}
