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
		ignore?:    string
		environment?: [string]: string
	}

	#context: {
		command: string
	}

	context: [string]: #context

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
		ignore:    "bash _scripts/ignoreBuild.bash"
		environment: {
			HUGO_ENV:     "production"
			GO_VERSION:   repo.goVersion
			NODE_VERSION: repo.nodeVersion
			HUGO_VERSION: repo.hugoVersion
		}
	}

	context: "deploy-preview": command:      "\(build.command) --baseURL $DEPLOY_PRIME_URL"
	context: "\(repo.alphaBranch)": command: "\(build.command) --baseURL https://alpha.cuelang.org"
	context: "production": command:          "\(build.command) --baseURL https://cuelang.org"

	redirects: [...{force: true, status: 302}]
	redirects: [for k, v in _redirects {from: k, to: v}]
	_redirects: {
		"/cl/*":                   "https://review.gerrithub.io/c/:splat"
		"/issue/*":                "https://github.com/cue-lang/cue/issues/:splat"
		"/issues/*":               "https://github.com/cue-lang/cue/issues/:splat"
		"/discussion/*":           "https://github.com/cue-lang/cue/discussions/:splat"
		"/discussions/*":          "https://github.com/cue-lang/cue/discussions/:splat"
		"/releases/*":             "https://github.com/cue-lang/cue/releases/:splat"
		"/s/community-calendar":   "https://calendar.google.com/calendar/u/0?cid=Y19lNzkxMWQ5OWQ4ZGIyMmU2ZTVjMzhkMTVkNjY2ZTVlNjdiNWE5ODNkZWU4N2JmNTU2NDY3NzI1OGIxYjJhMTFhQGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20"
		"/docs/tour/basics/":      "/docs/tour/basics/json-superset/"
		"/docs/tour/types/":       "/docs/tour/types/types/"
		"/docs/tour/references/":  "/docs/tour/references/scopes/"
		"/docs/tour/expressions/": "/docs/tour/expressions/operators/"
		"/docs/tour/packages/":    "/docs/tour/packages/packages/"
		// These old-site path globs deliberately don't include a trailing slash,
		// so as to catch the slashless "/docs/foo" path by itself.
		// They don't redirect to a specific page, but to the section index.
		"/docs/usecases*":     #"/search/?q=use%20case%20contentType:"Concept%20Guides""#
		"/docs/integrations*": "/docs/integration/"
		"/docs/concepts*":     "/docs/concept/"
		"/docs/references*":   "/docs/reference/"

		// The old-site tour paths /do/ preserve trailing path elements.
		"/docs/tutorials/tour/intro/*":       "/docs/tour/basics/:splat"
		"/docs/tutorials/tour/intro":         "/docs/tour/basics/"
		"/docs/tutorials/tour/types/*":       "/docs/tour/types/:splat"
		"/docs/tutorials/tour/types":         "/docs/tour/types/"
		"/docs/tutorials/tour/references/*":  "/docs/tour/references/:splat"
		"/docs/tutorials/tour/references":    "/docs/tour/references/"
		"/docs/tutorials/tour/expressions/*": "/docs/tour/expressions/:splat"
		"/docs/tutorials/tour/expressions":   "/docs/tour/expressions/"
		"/docs/tutorials/tour/packages/*":    "/docs/tour/packages/:splat"
		"/docs/tutorials/tour/packages":      "/docs/tour/packages/"
	}
}

#toToml: {
	#input: #config
	let tmpl = """
		{{with .build -}}
		[build]
		  functions = {{printf "%q" .functions}}
		  publish = {{printf "%q" .publish}}
		  command = {{printf "%q" .command}}
		  ignore = {{printf "%q" .ignore}}

		[build.environment]
		{{- range $key, $value := .environment}}
		  {{$key}} = {{printf "%q" $value -}}
		{{end}}
		{{- end}}

		[context]
		{{- range $context_name, $context_config := .context}}
		[context.{{ $context_name }}]
		{{- range $key, $value := $context_config}}
		  {{$key}} = {{printf "%q" $value -}}
		{{end}}
		{{- end}}
		{{range .redirects}}
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
