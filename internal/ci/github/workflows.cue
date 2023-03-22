// Copyright 2021 The CUE Authors
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

// package github declares the workflows for this project.
package github

import (
	"strings"

	"github.com/cue-lang/cuelang.org/internal/ci/core"
	"github.com/cue-lang/cuelang.org/internal/ci/base"
	"github.com/cue-lang/cuelang.org/internal/ci/gerrithub"

	"github.com/SchemaStore/schemastore/src/schemas/json"
)

// Note: the name of the workflows (and hence the corresponding .yml filenames)
// correspond to the environment variable names for gerritstatusupdater.
// Therefore, this filename must only be change in combination with also
// updating the environment in which gerritstatusupdater is running for this
// repository.
//
// This name is also used by the CI badge in the top-level README.
//
// This name is also used in the evict_caches lookups.
//
// i.e. don't change the names of workflows!
//
// In addition to separately declaring the workflows themselves, we define the
// shape of #workflows here as a cross-check that we don't accidentally change
// the name of workflows without reading this comment.
//
// We explicitly use close() here instead of a definition in order that we can
// cue export the github package as a test.
workflows: close({
	[string]: json.#Workflow

	trybot:             _
	trybot_dispatch:    _
	update_tip:         _
	push_tip_to_trybot: _
})

_#defaultBranch:     "master"
_#releaseTagPattern: "v*"

_#activeBranches: [_#defaultBranch, "alpha"]

// Use the latest Go version for extra checks,
// such as running tests with the data race detector.
_#latestStableGo: "1.20.x"

_#linuxMachine:   "ubuntu-20.04"
_#macosMachine:   "macos-11"
_#windowsMachine: "windows-2022"

// #_isLatestLinux evaluates to true if the job is running on Linux with the
// latest version of Go. This expression is often used to run certain steps
// just once per CI workflow, to avoid duplicated work.
#_isLatestLinux: "matrix.go-version == '\(_#latestStableGo)' && matrix.os == '\(_#linuxMachine)'"

_#goreleaserVersion: "v1.13.1"

// _gerrithub is an instance of ./gerrithub, parameterised by the properties of
// this project
_gerrithub: gerrithub & {
	#repositoryURL:                      core.githubRepositoryURL
	#botGitHubUser:                      "cueckoo"
	#botGitHubUserTokenSecretsKey:       "CUECKOO_GITHUB_PAT"
	#botGitHubUserEmail:                 "cueckoo@gmail.com"
	#botGerritHubUser:                   #botGitHubUser
	#botGerritHubUserPasswordSecretsKey: "CUECKOO_GERRITHUB_PASSWORD"
	#botGerritHubUserEmail:              #botGitHubUserEmail
}

// _base is an instance of ./base, parameterised by the properties of this
// project
//
// TODO: revisit the naming strategy here. _base and base are very similar.
// Perhaps rename the import to something more obviously not intended to be
// used, and then rename the field base?
_base: base & {
	#repositoryURL:                core.githubRepositoryURL
	#defaultBranch:                _#defaultBranch
	#botGitHubUser:                "cueckoo"
	#botGitHubUserTokenSecretsKey: "CUECKOO_GITHUB_PAT"
}

_#cacheDirs: [ "${{ steps.npm-cache-dir.outputs.dir }}", "${{ steps.go-mod-cache-dir.outputs.dir }}/cache/download", "${{ steps.go-cache-dir.outputs.dir }}"]

_#cachePre: [
	json.#step & {
		name: "Get npm cache directory"
		id:   "npm-cache-dir"
		run:  #"echo "dir=$(npm config get cache)" >> ${GITHUB_OUTPUT}"#
	},
	json.#step & {
		name: "Get go mod cache directory"
		id:   "go-mod-cache-dir"
		run:  #"echo "dir=$(go env GOMODCACHE)" >> ${GITHUB_OUTPUT}"#
	},
	json.#step & {
		name: "Get go build/test cache directory"
		id:   "go-cache-dir"
		run:  #"echo "dir=$(go env GOCACHE)" >> ${GITHUB_OUTPUT}"#
	},
	json.#step & {
		uses: "actions/cache@v3"
		with: {
			path: strings.Join(_#cacheDirs, "\n")

			// GitHub actions caches are immutable. Therefore, use a key which is
			// unique, but allow the restore to fallback to the most recent cache.
			// The result is then saved under the new key which will benefit the
			// next build
			key:            "${{ runner.os }}-${{ github.run_id }}"
			"restore-keys": "${{ runner.os }}"
		}
	},
]

_#cachePost: json.#step & {
	let qCacheDirs = [ for v in _#cacheDirs {"'\(v)'"}]
	run: "find \(strings.Join(qCacheDirs, " ")) -type f -amin +7200 -delete -print"
}
