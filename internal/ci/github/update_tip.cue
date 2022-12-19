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

import (
	"github.com/SchemaStore/schemastore/src/schemas/json"
)

// The update_tip workflow. Keeps the tip branch in "sync" with master.
update_tip: _base.#bashWorkflow & {

	name: "Update tip"
	on: push: branches: [_#defaultBranch]
	jobs: push: {
		"runs-on": _#linuxMachine
		steps: [
			_base.#checkoutCode & {
				// "pull_request" builds will by default use a merge commit,
				// testing the PR's HEAD merged on top of the master branch.
				// For consistency with Gerrit, avoid that merge commit entirely.
				// This doesn't affect "push" builds, which never used merge commits.
				with: ref: "${{ github.event.pull_request.head.sha }}"
			},
			json.#step & {
				name: "Force push to tip"
				run:  "git push -f origin master:tip"
			},
		]
	}
}
