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

// _gerrithub is an instance of ./gerrithub, parameterised by the properties of
// this project
_gerrithub: gerrithub & {
	#repositoryURL:                      _repo.githubRepositoryURL
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
	#repositoryURL:                _repo.githubRepositoryURL
	#defaultBranch:                _repo.defaultBranch
	#botGitHubUser:                "cueckoo"
	#botGitHubUserTokenSecretsKey: "CUECKOO_GITHUB_PAT"
}

_cacheDirs: [ "${{ steps.npm-cache-dir.outputs.dir }}", "${{ steps.go-mod-cache-dir.outputs.dir }}/cache/download", "${{ steps.go-cache-dir.outputs.dir }}"]

_cachePre: [
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
			path: strings.Join(_cacheDirs, "\n")

			// GitHub actions caches are immutable. Therefore, use a key which is
			// unique, but allow the restore to fallback to the most recent cache.
			// The result is then saved under the new key which will benefit the
			// next build
			key:            "${{ runner.os }}-${{ github.run_id }}"
			"restore-keys": "${{ runner.os }}"
		}
	},
]

_cachePost: json.#step & {
	let qCacheDirs = [ for v in _cacheDirs {"'\(v)'"}]
	run: "find \(strings.Join(qCacheDirs, " ")) -type f -amin +7200 -delete -print"
}
