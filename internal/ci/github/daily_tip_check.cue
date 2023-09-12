// Copyright 2023 The CUE Authors
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

workflows: daily_tip_check: _repo.bashWorkflow & {
	on: {
		// Run ever day at 0320 UTC.
		schedule: [
			{cron: "20 3 * * *"},
		]

		// Allow this workflow to be triggered via workflow_dispatch and
		// the ci/test branch for testing. But ignore release tags.
		workflow_dispatch: {}
		push: {
			branches: [_repo.testDefaultBranch]
			"tags-ignore": [_repo.releaseTagPattern]
		}
	}

	jobs: run: {
		strategy: "fail-fast": false
		"runs-on": _repo.linuxMachine

		steps: [
			// Trigger a trybot workflow_dispatch on the alpha branch.
			//
			// TODO: do not hardcode trybot.yml below.
			json.#step & {
				run: "gh workflow run --r \(_repo.alphaBranch) --repo \(_repo.githubRepositoryPath) trybot.yml -f scheduled=true"
			},
		]
	}
}
