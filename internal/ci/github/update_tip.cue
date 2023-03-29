// Copyright 2022 The CUE Authors
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

// The update_tip workflow. Keeps the tip branch in "sync" with master.
workflows: update_tip: _base.#bashWorkflow & {

	name: "Update tip"
	on: {
		push: branches: [_repo.defaultBranch]
		repository_dispatch: {}
	}

	// Ensure we only ever have a single tip deploy running at a time. This
	// avoids any potential race condition between concurrent deploys of
	// "latest".
	concurrency: "deploy"

	jobs: push: {
		"runs-on": _repo.linuxMachine

		// Only run this workflow in the main repository, and if we are triggered
		// by repository_dispatch (which will happen if the cue-lang/cue repo
		// needs to tell us to rebuild tip) only do so if our payload is of
		// the correct type.
		if: "${{ github.repository == '\(_repo.githubRepositoryPath)' && (github.event_name != 'repository_dispatch' || github.event.client_payload.type == 'rebuild_tip') }}"

		steps: [
			_gerrithub.#writeNetrcFile,
			_base.#checkoutCode & {
				with: ref: _repo.defaultBranch
			},
			_#installNode,
			_#installGo,
			_#installHugo,

			// cachePre must come after installing Node and Go, because the cache locations
			// are established by running each tool.
			for v in _#cachePre {v},

			_#tipDist,
			_#installNetlifyCLI,
			_#netlifyDeploy & {
				#prod: true
				#site: _repo.netlifySites.tip
				name:  "Deploy tip"
			},
			_#cachePost,
		]
	}
}
