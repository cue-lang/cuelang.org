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

	"cue.dev/x/githubactions"
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

		// The tip of cue-lang/cue advances when a projection from its
		// authoritative repository is published, and nothing tells this
		// repository when that happens. Poll for it nightly: the changes job
		// below checks whether tip.cuelang.org is behind, and the deploy runs
		// only when it is.
		schedule: [{cron: "27 4 * * *"}]
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

	jobs: changes: {
		"runs-on": _repo.linuxMachine + _repo.overrideCacheTagDispatch

		// We only want to run this workflow in the main repo. GitHub skips
		// the dependents of a skipped job, so the test job need not repeat
		// this.
		if: "github.repository == '\(_repo.githubRepositoryPath)' && (github.ref == 'refs/heads/\(_repo.defaultBranch)' || \(_repo.isTestDefaultBranch))"

		outputs: deploy: "${{ steps.changes.outputs.deploy }}"

		steps: [_checkTipBehind]
	}

	jobs: test: {
		"runs-on": _repo.linuxMachine + _repo.overrideCacheTagDispatch

		_packagesPublish

		needs: "changes"
		if:    "needs.changes.outputs.deploy == 'true'"

		steps: [
			for v in _repo.checkoutCode {v},

			for v in _installDockerMacOS {v},
			_installMacOSUtils,
			_installNode,
			for v in _installGo {v},
			_installHugoLinux,
			_installHugoMacOS,

			_setNoWriteCache,

			for v in _setupCaches {v},

			// Run these early checks after we have restored the Go caches,
			// as the checks are Go programs themselves.
			_repo.earlyChecks,

			_contentLint,

			_repo.loginCentralRegistry,

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

			_deployTipCuelangOrg,
		]
	}
}

// _checkTipBehind decides whether a scheduled run has anything to deploy: it
// compares the tip of cue-lang/cue with the commit the deployed site was
// built against, recorded in tip.cue on the tip branch by
// tipUseAlternativeCUE.bash. Every other event deploys unconditionally.
// Neither side needs a checkout.
_checkTipBehind: githubactions.#Step & {
	name: "Check whether tip.cuelang.org is behind cue-lang/cue"
	id:   "changes"
	run: """
		deploy=true
		if [[ "$GITHUB_EVENT_NAME" == "schedule" ]]; then
			want=$(git ls-remote https://github.com/cue-lang/cue refs/heads/master | cut -f1)
			git init -q tip && cd tip
			# A missing or unreachable tip branch deploys rather than blocking.
			git fetch -q --depth=1 https://github.com/cue-lang/cuelang.org tip || true
			if git show FETCH_HEAD:tip.cue 2>/dev/null | grep -q "${want:0:12}"; then
				echo "tip.cuelang.org is already built against cue-lang/cue@$want"
				deploy=false
			fi
		fi
		echo "deploy=$deploy" | tee -a $GITHUB_OUTPUT
		"""
}
