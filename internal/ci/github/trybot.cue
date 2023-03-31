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
	"list"
	"strings"
	"strconv"

	"github.com/SchemaStore/schemastore/src/schemas/json"

	"github.com/cue-lang/cuelang.org/internal/ci/netlify"
)

// The trybot workflow.
workflows: trybot: _repo.bashWorkflow & {
	name: _repo.trybot.name

	on: {
		push: {
			branches: list.Concat([["trybot/*/*", _repo.testDefaultBranch], _repo.protectedBranchPatterns]) // do not run PR branches
			"tags-ignore": [_repo.releaseTagPattern]
		}
		pull_request: {}
	}

	jobs: {
		test: {
			"runs-on": _repo.linuxMachine

			steps: [
				for v in _repo.checkoutCode {v},

				// Early git checks
				_repo.earlyChecks,

				_installNode,
				_installGo,
				_installHugo,

				// cachePre must come after installing Node and Go, because the cache locations
				// are established by running each tool.
				for v in _goCaches {v},

				// All tests on protected branches should skip the test cache.
				// The canonical way to do this is with -count=1. However, we
				// want the resulting test cache to be valid and current so that
				// subsequent CLs in the trybot repo can leverage the updated
				// cache. Therefore, we instead perform a clean of the testcache.
				json.#step & {
					if:  "github.repository == '\(_repo.githubRepositoryPath)' && (\(_repo.isProtectedBranch) || github.ref == 'refs/heads/\(_repo.testDefaultBranch)')"
					run: "go clean -testcache"
				},

				json.#step & {
					// The latest git clean check ensures that this call is effectively
					// side effect-free. Using GOPROXY=direct ensures we don't accidentally
					// hit a stale cache in the proxy.
					//
					// For that reason, we also set GONOSUMDB in order to avoid the
					// regular issues we see with recent versions not being
					// available yet in index.golang.org and hence the sumdb.
					name: "Ensure latest CUE"
					run: """
						GONOSUMDB=cuelang.org/go GOPROXY=direct go get -d cuelang.org/go@latest
						go mod tidy
						go mod tidy
						"""
				},

				// Go generate steps
				_goGenerate & {
					name: "Regenerate"
				},

				// Go test steps
				_goTest & {
					name: "Test"
				},

				// go mod tidy
				_modTidy & {
					name: "Check module is tidy"
				},

				_dist,
				_repo.checkGitClean,

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
				_netlifyDeploy & {
					if:     "${{github.repository == '\(_repo.githubRepositoryPath)-trybot' && startsWith(github.head_ref, 'trybot/')}}"
					#site:  _repo.netlifySites.cls
					#alias: "${{ steps.alias.outputs.alias }}"
					name:   "Deploy preview of CL"
				},
			]
		}
	}

	_goGenerate: json.#step & {
		name: string
		run:  "go generate ./..."
	}

	_goTest: json.#step & {
		name: string
		run:  "go test ./..."
	}

	_modTidy: json.#step & {
		name: string
		run:  "go mod tidy"
	}
}

_installNode: json.#step & {
	name: "Install Node"
	uses: "actions/setup-node@v3"
	with: {
		"node-version": _repo.nodeVersion
	}
}

_installGo: _repo.installGo & {
	with: "go-version": _repo.goVersion
}

_installHugo: json.#step & {
	name: "Install Hugo"
	uses: "peaceiris/actions-hugo@v2"
	with: {
		"hugo-version": _repo.hugoVersion
		extended:       true
	}
}

_dist: json.#step & {
	name: *"Dist" | string
	run:  "./build.bash"
}

_tipDist: _dist & {
	name: "Tip dist"
	env: BRANCH: "tip"
}

_installNetlifyCLI: json.#step & {
	name: "Install Netlify CLI"
	run:  "npm install -g netlify-cli@\(_repo.netlifyCLIVersion)"
}

// _netlifyDeploy is used to push CLs for preview but also to deploy tip
_netlifyDeploy: json.#step & {
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
