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
	"path"
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
			branches: list.Concat([[_repo.testDefaultBranch], _repo.protectedBranchPatterns]) // do not run PR branches
			"tags-ignore": [_repo.releaseTagPattern]
		}
		pull_request: {}
	}

	jobs: {
		test: {
			if: "\(_repo.containsTrybotTrailer) || ! \(_repo.containsDispatchTrailer)"

			steps: [
				for v in _repo.checkoutCode {v},

				_repo.earlyChecks,

				_setupBuildx,
				_installNode,
				_installGo,
				_installHugo,

				// cachePre must come after installing Node and Go, because the cache locations
				// are established by running each tool.
				for v in _setupGoActionsCaches {v},

				// Disable checkout for "latest" CUE for now. Go does not (yet)
				// handle a query for cuelang.org/go@v0.6 when there is only a
				// prerelease version matching that query.
				//
				// json.#step & {
				// 	// The latest git clean check ensures that this call is effectively
				// 	// side effect-free. Using GOPRIVATE ensures we don't accidentally
				// 	// hit a stale cache in the proxy.
				// 	name: "Ensure latest CUE"
				// 	run: """
				// 		GOPRIVATE=cuelang.org/go go get -d cuelang.org/go@latest
				// 		go mod tidy
				// 		go mod tidy
				// 		"""
				// },

				// Rebuild docker image
				json.#step & {
					run: "./_scripts/buildDockerImage.bash"
				},

				// Go generate steps
				_goGenerate & {
					name: "Regenerate"
				},

				// Go test steps
				_goTest & {
					name: "Test"
				},

				// Run staticcheck
				json.#step & {
					name: "staticcheck"
					run:  "./_scripts/staticcheck.bash"
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

				// Only run a deploy of tip if we are running as part of the trybot repo,
				// with a TryBot-Trailer, i.e. as part of CI check of the trybot workflow
				_netlifyDeploy & {
					if:     "github.repository == '\(_repo.trybotRepositoryPath)' && \(_repo.containsTrybotTrailer)"
					#site:  _repo.netlifySites.cls
					#alias: "cl-${{ \(_dispatchTrailerExpr).CL }}-${{ \(_dispatchTrailerExpr).patchset }}"
					name:   "Deploy preview of CL"
				},
			]
		}
	}

	// TODO: this belongs in base. Captured in cuelang.org/issue/2327
	_dispatchTrailerExpr: "fromJSON(steps.DispatchTrailer.outputs.value)"
	_goGenerate:          json.#step & {
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
	run:  "./_scripts/build.bash"
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

// _setupGoActionsCaches is shared between trybot and update_tip.
_setupGoActionsCaches: _repo.setupGoActionsCaches & {
	#goVersion: _installGo.with."go-version"

	// Unfortunate that we need to hardcode here. Ideally we would be able to derive
	// the OS from the runner. i.e. from _linuxWorkflow somehow.
	#os: "Linux"

	let repoName = path.Base(_repo.githubRepositoryPath)
	let github_workspace = "~/work/\(repoName)/\(repoName)/"

	#additionalCacheDirs: [
		"~/.cache/dockercache",
		"\(github_workspace)/hugo/node_modules",
		"\(github_workspace)/playground/node_modules",
	]

	_
}

_setupBuildx: {
	name: "Set up Docker Buildx"
	uses: "docker/setup-buildx-action@v2"
}
