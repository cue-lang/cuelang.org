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

	"github.com/cue-lang/cuelang.org/internal/ci/base"
	"github.com/cue-lang/cuelang.org/internal/ci/netlify"
)

// The trybot workflow.
workflows: trybot: _base.#bashWorkflow & {
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
			branches: [ for v in _#activeBranches {v}, _base.#testDefaultBranch]
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

				// Early git checks
				base.#earlyChecks,

				_#installNode,
				_#installGo,
				_#installHugo,

				// cachePre must come after installing Node and Go, because the cache locations
				// are established by running each tool.
				for v in _#cachePre {v},

				json.#step & {
					// The latest git clean check ensures that this call is effectively
					// side effect-free. Using GOPROXY=direct ensures we don't accidentally
					// hit a stale cache in the proxy.
					name: "Ensure latest CUE"
					run: """
						GOPROXY=direct go get -d cuelang.org/go@latest
						go mod tidy
						go mod tidy
						"""
				},

				// Go generate steps
				_#goGenerate & {
					name: "Regenerate"
				},

				// Go test steps
				_#goTest & {
					name: "Test"
				},

				// go mod tidy
				_#modTidy & {
					name: "Check module is tidy"
				},

				_#dist,
				_base.#checkGitClean,

				// Now the frontend build has happened, ensure that linters pass
				json.#step & {
					"working-directory": "hugo"
					run: """
						npm run lint
						"""
				},

				// GitHub offers very limited expressions at runtime of a workflow.
				// Instead we have to resort to dropping down to shell and then
				// setting an output variable. We do so to construct an alias name
				// of the form "cl_${CL}_${patchset}" that will be used when deploying
				// a preview of a CL. The format of the ref we need to mutate here is:
				//
				//     trybot/I01e0e139902da54151659fe595f23dd519f54637/2e79979116f96a26c9240e0e9c55b31d4311cf93/547774/11
				//
				json.#step & {
					if: "${{github.repository == '\(_repo.githubRepositoryPath)-trybot' && startsWith(github.head_ref, 'trybot/')}}"
					id: "alias"

					// Use github.head_ref per
					// https://docs.github.com/en/actions/learn-github-actions/contexts#github-context.
					// Because we now trigger workflow runs using a PR, which means
					// we need to consult head_ref in order to get the branch name
					run: #"""
						alias="$(echo '${{github.head_ref}}' | sed -E 's/^trybot\/I[a-f0-9]+\/[a-f0-9]+\/([0-9]+)\/([0-9]+).*/cl-\1-\2/')"
						echo "alias=$alias" >> $GITHUB_OUTPUT
						"""#
				},

				// Only run a deploy of tip if we are running as part of the trybot repo,
				// with a branch name that matches the trybot pattern
				_#netlifyDeploy & {
					if:     "${{github.repository == '\(_repo.githubRepositoryPath)-trybot' && startsWith(github.head_ref, 'trybot/')}}"
					#site:  _repo.netlifySites.cls
					#alias: "${{ steps.alias.outputs.alias }}"
					name:   "Deploy preview of CL"
				},

				_#cachePost,
			]
		}
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
		"node-version": _repo.nodeVersion
	}
}

_#installGo: _base.#installGo & {
	with: "go-version": _repo.goVersion
}

_#installHugo: json.#step & {
	name: "Install Hugo"
	uses: "peaceiris/actions-hugo@v2"
	with: {
		"hugo-version": _repo.hugoVersion
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
	run:  "npm install -g netlify-cli@\(_repo.netlifyCLIVersion)"
}

// _#netlifyDeploy is used to push CLs for preview but also to deploy tip
_#netlifyDeploy: json.#step & {
	#prod:   *false | bool
	#site:   string
	#alias?: string
	if !#prod {
		#alias: *"" | string
	}
	let nc = netlify.config
	let prod = [ if #prod {"--prod"}, ""][0]
	let uSite = strings.ToUpper(strings.Replace(#site, "-", "_", -1))
	let alias = [ if #alias != _|_ if #alias != "" {"--alias \(#alias)"}, ""][0]

	name: string
	run:  "netlify deploy \(alias) -f \(nc.build.functions) -d \(nc.build.publish) -m \(strconv.Quote(name)) -s \(#site) --debug \(prod)"
	env: NETLIFY_AUTH_TOKEN: "${{ secrets.NETLIFY_AUTH_TOKEN_\(uSite)}}"
}
