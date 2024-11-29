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
	"strings"
	"strconv"

	"github.com/cue-tmp/jsonschema-pub/exp1/githubactions"

	"github.com/cue-lang/cuelang.org/internal/ci/netlify"
)

workflows: tipdeploy: _repo.bashWorkflow & {
	name: _repo.trybot.name

	on: {
		push: branches: [_repo.testDefaultBranch]

		// Allow the trybots to run in response to a workflow_dispatch event.
		// One source of workflow_dispatch events is the daily_tip_check
		// workflow.
		workflow_dispatch: {
			// TODO: work out how to derive this "schema" from a CUE schema
			inputs: {
				scheduled: {
					description: "Whether a workflow_dispatch was itself the result of a scheduled dispatch"
					required:    true
					default:     "false" // this is a string type field
				}
			}
		}
	}

	jobs: test: {
		"runs-on": _repo.linuxMachine

		steps: [
			for v in _repo.checkoutCode {v},

			// Early check to fail in case we are running as a transitive result
			// of the daily_tip_check workflow and the HEAD commit (remembering
			// that such a workflow is triggered against the tip of the branch,
			// alpha in this case) contains the Preprocessor-No-Write-Cache
			// trailer.
			githubactions.#Step & {
				name: "Fail if Preprocessor-No-Write-Cache trailer is present for a scheduled workflow run"
				if:   "github.event.inputs.scheduled == 'true'"
				run:  "! ./_scripts/noWriteCache.bash HEAD"
			},

			// Set CI_NO_SKIP_CACHE if we detect we are in a situation where we
			// can safely read the cache. To not be specific to the trybot repo we
			// instead say it's safe to read the cache for any repo other than the
			// main repo.
			githubactions.#Step & {
				if: "github.repository != '\(_repo.githubRepositoryPath)'"
				run: """
					echo 'Setting CI_NO_SKIP_CACHE=true'
					echo "CI_NO_SKIP_CACHE=true" >> $GITHUB_ENV

					"""
			},

			for v in _installDockerMacOS {v},

			_installMacOSUtils,
			_setupBuildx,
			_installNode,
			for v in _installGo {v},
			_installHugoLinux,
			_installHugoMacOS,

			// If the commit under test contains the trailer
			// Preprocessor-No-Write-Cache: true, then set the
			// PREPROCESSOR_NOWRITECACHE env var to non-empty.
			githubactions.#Step & {
				name: "Set PREPROCESSOR_NOWRITECACHE if Preprocessor-No-Write-Cache: true"
				run: """
					if ./_scripts/noWriteCache.bash HEAD
					then
						echo 'Found Preprocessor-No-Write-Cache trailer'
						echo "PREPROCESSOR_NOWRITECACHE=true" >> $GITHUB_ENV
					fi

					"""
			},

			// cachePre must come after installing Node and Go, because the cache locations
			// are established by running each tool.
			for v in _setupGoActionsCaches {v},

			// Run these early checks after we have restored the Go caches,
			// as the checks are Go programs themselves.
			_repo.earlyChecks,

			githubactions.#Step & {
				name: "Perform early content checks"
				run:  "_scripts/contentLint.bash"
			},

			// This is the only step that needs to be given (read-only) access to the Central Registry.
			// TODO: adopt any more specific command coming from https://cuelang.org/issue/3512.
			// TODO: add cache dir to CI cache when it's visible via https://cuelang.org/issue/2838.
			githubactions.#Step & {
				name: "Populate CUE dependency cache"
				env: CUE_TOKEN: "${{ secrets.NOTCUECKOO_CUE_TOKEN }}"
				run: "_scripts/cacheWarm.bash"
			},

			// A number of pages that are part of cuelang.org require interacting
			// with the Central Registry. These pages require users with slightly
			// different access levels, in order to simulate (for example) private
			// modules, with some users granted access whilst others are denied.
			// The Central Registry has a special endpoint which generates access
			// tokens for a set of such test user IDs. Access to this endpoint is
			// sensitive, because in theory there is privilege escalation (even
			// though in reality the test user IDs are intentionally not used
			// for anything sensitive). As such, we use porcuepine (an account
			// that is controlled by CUE Labs who also run the Central
			// Registry) here in order to more carefully control in a CI
			// environment who has access to this endpoint.
			githubactions.#Step & {
				name: "log into the central registry as porcuepine"
				run:  "go run cuelang.org/go/cmd/cue login --token ${{ secrets.PORCUEPINE_CUE_TOKEN }}"
			},

			githubactions.#Step & {
				name: "tip.cuelang.org: Patch the site to be compatible with the tip of cue-lang/cue"
				run:  "_scripts/tipPatchApply.bash"
			},

			githubactions.#Step & {
				name: "tip.cuelang.org: Configure the site to use the tip of cue-lang/cue"
				// Only run in the main repo on the default branch or its designated test branch (i.e not CLs)
				// so that CLs aren't blocked by failures caused by unrelated changes.
				if: "github.repository == '\(_repo.githubRepositoryPath)' && (github.ref == 'refs/heads/\(_repo.defaultBranch)' || \(_repo.isTestDefaultBranch))"

				// Force Go to bypass the module proxy and sumdb for the
				// cuelang.org/go module, ensuring that the absolute latest CUE
				// pseudo-version is available to test against.
				//
				// TODO: is this really necessary? Tracking
				// https://golang.org/issue/70042 to confirm.
				env: GOPRIVATE: "cuelang.org/go"

				run: "_scripts/tipUseAlternativeCUE.bash"
			},
			githubactions.#Step & {
				name: "tip.cuelang.org: Build the site against the tip of cue-lang/cue"
				// Only run in the main repo on the default branch or its designated test branch (i.e not CLs)
				// so that CLs aren't blocked by failures caused by unrelated changes.
				if:  "github.repository == '\(_repo.githubRepositoryPath)' && (github.ref == 'refs/heads/\(_repo.defaultBranch)' || \(_repo.isTestDefaultBranch))"
				run: "_scripts/regenPostInfraChange.bash"

				// TODO: See comment in previous step
				env: GOPRIVATE: "cuelang.org/go"
			},
			githubactions.#Step & {
				name: "tip.cuelang.org: Deploy the site"
				// Only run in the main repo on the default branch or its designated test branch.
				if:  "github.repository == '\(_repo.githubRepositoryPath)' && (github.ref == 'refs/heads/\(_repo.defaultBranch)' || \(_repo.isTestDefaultBranch))"
				run: """
				git config http.https://github.com/.extraheader "AUTHORIZATION: basic $(echo -n \(_repo.botGitHubUser):${{ secrets.\(_repo.botGitHubUserTokenSecretsKey) }} | base64)"
				_scripts/tipDeploy.bash '\(_repo.botGitHubUser)' '\(_repo.botGitHubUserEmail)'
				"""

				// TODO: See comment in previous step
				env: GOPRIVATE: "cuelang.org/go"
			},
		]
	}

	// TODO: this belongs in base. Captured in cuelang.org/issue/2327
	_dispatchTrailerExpr: "fromJSON(steps.DispatchTrailer.outputs.value)"
	_goGenerate: githubactions.#Step & {
		name: string
		run:  "go generate ./..."
	}

	_goTest: githubactions.#Step & {
		name: string
		run:  "go test ./..."
	}

	_modTidy: githubactions.#Step & {
		name: string
		run:  "go mod tidy"
	}
}

_installNode: githubactions.#Step & {
	name: "Install Node"
	uses: "actions/setup-node@v4"
	with: "node-version": _repo.nodeVersion
}

_installGo: _repo.installGo & {
	#setupGo: with: "go-version": _repo.goVersion
	_
}

_installHugoLinux: _linuxStep & {
	name: "Install Hugo (${{ runner.os }})"
	uses: "peaceiris/actions-hugo@v3"
	with: {
		"hugo-version": _repo.hugoVersion
		extended:       true
	}
}

_installHugoMacOS: _macOSStep & {
	name: "Install Hugo (${{ runner.os }})"
	run:  "brew install hugo"
}

_installDockerMacOS: [
	..._macOSStep & {
		_name: string
		name:  _name + " (${{runner.os}})"
	},
] & [
	// Set TMPDIR to be within the HOME directory so that bind mounts with
	// docker (via colima) work. If we don't set this to be a path within $HOME,
	// then we end up with a mount-ed directory. And this does not work via -v
	// bind mounts.
	githubactions.#Step & {
		_name: "Set TMPDIR environment variable"
		run: """
			mkdir $HOME/.tmp
			echo "TMPDIR=$HOME/.tmp" >> $GITHUB_ENV
			"""
	},
	githubactions.#Step & {
		_name: "Write lima config"
		run: """
			mkdir -p ~/.lima/default
			cat <<EOD > ~/.lima/default/lima.yaml
			mounts:
			  - location: "~"
				 writable: true
			  - location: "$TMPDIR"
				 writable: true
			EOD
			"""
	},
	githubactions.#Step & {
		_name: "Install Docker"
		run: """
			brew install colima docker
			colima start --mount-type virtiofs
			sudo ln -sf $HOME/.colima/default/docker.sock /var/run/docker.sock
			"""
	},
	githubactions.#Step & {
		_name: "Set DOCKER_HOST environment variable"
		run: """
			echo "DOCKER_HOST=unix://$HOME/.colima/default/docker.sock" >> $GITHUB_ENV
			"""
	},
]

_macOSStep: githubactions.#Step & {
	if: "runner.os == 'macOS'"
}

_linuxStep: githubactions.#Step & {
	if: "runner.os == 'Linux'"
}

_updateHomebrew: _macOSStep & {
	name: "Update Homebrew (macOS)"
	run: """
		brew update
		"""
}

_installMacOSUtils: _macOSStep & {
	name: "Install macOS utils"
	run: """
		brew install coreutils
		"""
}

_dist: githubactions.#Step & {
	name: *"Dist" | string
	// enforce https, and allow trailing slash to be added universally *if
	// needed* here, not by the _dist consumer.
	_baseURL: string & =~"^https://" & !~"/$"
	run:      "./_scripts/build.bash --baseURL \(_baseURL)"
}

_installNetlifyCLI: githubactions.#Step & {
	name: "Install Netlify CLI"
	run:  "npm install -g netlify-cli@\(_repo.netlifyCLIVersion)"
}

// _netlifyDeploy is used to push CLs for preview but also to deploy tip
_netlifyDeploy: githubactions.#Step & {
	#prod:   *false | bool
	#site:   string
	#alias?: string
	if #alias != _|_ {
		#prime_url: CL: "https://\(#alias)--\(#site).netlify.app"
	}
	if !#prod {
		#alias: *"" | string
	}
	let nc = netlify.config
	let prod = [if #prod {"--prod"}, ""][0]
	let uSite = strings.ToUpper(strings.Replace(#site, "-", "_", -1))
	let alias = [if #alias != _|_ if #alias != "" {"--alias \(#alias)"}, ""][0]

	name: string
	run:  "netlify deploy \(alias) -f \(nc.build.functions) -d \(nc.build.publish) -m \(strconv.Quote(name)) -s \(#site) --debug \(prod)"
	env: NETLIFY_AUTH_TOKEN: "${{ secrets.NETLIFY_AUTH_TOKEN_\(uSite)}}"
}

// _setupGoActionsCaches is shared between trybot and update_tip.
_setupGoActionsCaches: _repo.setupGoActionsCaches & {
	#goVersion: _installGo.#setupGo.with."go-version"

	// Unfortunate that we need to hardcode here. Ideally we would be able to derive
	// the OS from the runner. i.e. from _linuxWorkflow somehow.
	#os: "${{ runner.os }}"

	#additionalCacheDirs: [
		"~/.cache/dockercache",
		"~/.cache/node-gyp",
		"~/.npm",
		"${{ github.workspace }}/playground/.webpack_cache",
	]

	_
}

_setupBuildx: githubactions.#Step & {
	name: "Set up Docker Buildx"
	uses: "docker/setup-buildx-action@v3"
}
