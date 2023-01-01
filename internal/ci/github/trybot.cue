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
	"strings"
	"strconv"

	"github.com/SchemaStore/schemastore/src/schemas/json"

	"github.com/cue-lang/cuelang.org/internal/ci/core"
	"github.com/cue-lang/cuelang.org/internal/ci/netlify"
)

// The trybot workflow.
trybot: _base.#bashWorkflow & {
	// Note: the name of this workflow is used by gerritstatusupdater as an
	// identifier in the status updates that are posted as reviews for this
	// workflows, but also as the result label key, e.g. "TryBot-Result" would
	// be the result label key for the "TryBot" workflow. Note the result label
	// key is therefore tied to the configuration of this repository.
	//
	// This name also shows up in the CI badge in the top-level README.
	name: "TryBot"

	on: {
		push: {
			branches: ["trybot/*/*/*/*", _#defaultBranch, _base.#testDefaultBranch] // do not run PR branches
		}
		pull_request: {}
	}

	jobs: {
		test: {
			"runs-on": _#linuxMachine
			steps: [
				_base.#checkoutCode & {
					// "pull_request" builds will by default use a merge commit,
					// testing the PR's HEAD merged on top of the master branch.
					// For consistency with Gerrit, avoid that merge commit entirely.
					// This doesn't affect "push" builds, which never used merge commits.
					with: ref: "${{ github.event.pull_request.head.sha }}"
				},
				_#cachePre,
				_#installNode,
				_#installGo,
				_#installHugo,

				json.#step & {
					// The latest git clean check ensures that this call is effectively
					// side effect-free. Using GOPROXY=direct ensures we don't accidentally
					// hit a stale cache in the proxy.
					name: "Ensure latest CUE"
					run: """
						GOPROXY=direct go get -d cuelang.org/go@latest
						go mod tidy
						cd play
						GOPROXY=direct go get -d cuelang.org/go@latest
						go mod tidy
						"""
				},

				_#play & {
					name: "Re-vendor play"
					run:  "./_scripts/revendorToolsInternal.bash"
				},

				// Go generate steps
				_#goGenerate & {
					name: "Regenerate"
				},
				_#goGenerate & _#play & {
					name: "Regenerate play"
				},

				// Go test steps
				_#goTest & {
					name: "Test"
				},
				_#goTest & _#play & {
					name: "Test play"
				},

				// go mod tidy
				_#modTidy & {
					name: "Check module is tidy"
				},
				_#modTidy & _#play & {
					name: "Check play module is tidy"
				},

				_#dist,

				json.#step & {
					name: "Verify commit is clean"
					run: """
						test -z "$(git status --porcelain)" || (git status; git diff; false)
						"""
				},

				// Note we intentially run this after the porcelain check because
				// this step intentionally updates the play/go.{mod,sum}. This step
				// purely exists to exercise this code path and determine whether it
				// passes/fails.
				_#tipDist,

				_#cachePost,
			]
		}
	}

	_#play: json.#step & {
		"working-directory": "./play"
	}

	_#goGenerate: json.#step & {
		name: string
		run:  "go generate ./..."
	}

	_#goTest: json.#step & {
		name: string
		run:  "go test ./..."
	}

	_#modTidy: json.#step & {
		name: string
		run:  "go mod tidy"
	}
}

_#installNode: json.#step & {
	name: "Install Node"
	uses: "actions/setup-node@v3"
	with: {
		"node-version": core.#nodeVersion
	}
}

_#installGo: _base.#installGo & {
	with: "go-version": core.#goVersion
}

_#installHugo: json.#step & {
	name: "Install Hugo"
	uses: "peaceiris/actions-hugo@v2"
	with: {
		"hugo-version": core.#hugoVersion
		extended:       true
	}
}

_#dist: json.#step & {
	name: *"Dist" | string
	run:  "./build.bash"
}

_#tipDist: _#dist & {
	name: "Tip dist"
	env: BRANCH: "tip"
}

_#installNetlifyCLI: json.#step & {
	name: "Install Netlify CLI"
	run:  "npm install -g netlify-cli@\(core.#netlifyCLIVersion)"
}

// _#netlifyDeploy is used to push CLs for preview but also to deploy tip
_#netlifyDeploy: json.#step & {
	#prod: *false | bool
	#site: string
	let nc = netlify.config
	let prod = [ if #prod {"--prod"}, ""][0]
	let uSite = strings.ToUpper(strings.Replace(#site, "-", "_", -1))

	name: string
	run:  "netlify deploy -f \(nc.build.functions) -d \(nc.build.publish) -m \(strconv.Quote(name)) -s \(#site) --debug \(prod)"
	env: NETLIFY_AUTH_TOKEN: "${{ secrets.NETLIFY_AUTH_TOKEN_\(uSite)}}"
}
