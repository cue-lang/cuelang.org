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

// package netlify contains the configuration for netlify. We export using a
// manual process to toml config file.
package netlify

import (
	"text/template"

	"github.com/cue-lang/cuelang.org/internal/ci/repo"
)

#config: {
	build: {
		functions?: string
		publish?:   string
		command?:   string
		environment?: [string]: string
	}

	#context: {
		command: string
	}

	context: {
		"deploy-preview": #context
	}

	redirects: [...{
		from:   string
		to:     string
		status: int
		force:  bool
	}]

}

config: #config & {
	build: {
		functions: "functions"
		publish:   "_public"
		command:   "bash _scripts/build.bash"
		environment: {
			HUGO_ENV:     "production"
			GO_VERSION:   repo.goVersion
			NODE_VERSION: repo.nodeVersion
			HUGO_VERSION: repo.hugoVersion
		}
	}

	context: "deploy-preview": command: "\(build.command) -b $DEPLOY_PRIME_URL"

	redirects: [...{force: true, status: 302}]
	redirects: [{
		from: "/cl/*"
		to:   "https://review.gerrithub.io/c/:splat"
	}, {
		from: "/issue/*"
		to:   "https://github.com/cue-lang/cue/issues/:splat"
	}, {
		from: "/download"
		to:   "/docs/install"
	}, {
		from: "/issues/*"
		to:   "https://github.com/cue-lang/cue/issues/:splat"
	}, {
		from: "/discussion/*"
		to:   "https://github.com/cue-lang/cue/discussions/:splat"
	}, {
		from: "/discussions/*"
		to:   "https://github.com/cue-lang/cue/discussions/:splat"
	}, {
		from: "/releases/*"
		to:   "https://github.com/cue-lang/cue/releases/:splat"
	}, {
		from: "/s/community-calendar"
		to:   "https://calendar.google.com/calendar/u/0?cid=Y19lNzkxMWQ5OWQ4ZGIyMmU2ZTVjMzhkMTVkNjY2ZTVlNjdiNWE5ODNkZWU4N2JmNTU2NDY3NzI1OGIxYjJhMTFhQGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20"
	}]
}

#toToml: {
	#input: #config
	let tmpl = """
		{{with .build -}}
		[build]
		  functions = {{printf "%q" .functions}}
		  publish = {{printf "%q" .publish}}
		  command = {{printf "%q" .command}}

		[build.environment]
		{{- range $key, $value := .environment}}
		{{$key}} = {{printf "%q" $value -}}
		{{end}}
		{{end}}

		{{- with (index .context "deploy-preview") }}
		[context.deploy-preview]
		command = {{printf "%q" .command}}
		{{end}}

		{{- range .redirects}}
		[[redirects]]
		  from = {{printf "%q" .from}}
		  to = {{printf "%q" .to}}
		  status = {{printf "%d" .status}}
		  force = {{printf "%t" .force}}
		{{end}}
		"""

	// TODO: move to encoding/toml when it exists. See cuelang.org/issue/68.
	template.Execute(tmpl, #input)
}
