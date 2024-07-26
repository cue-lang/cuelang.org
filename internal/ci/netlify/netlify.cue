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

	redirects: [...{force: true, status: *302 | ( >=300 & <=308 )}]
	redirects: [{
		from: "/cl/*"
		to:   "https://review.gerrithub.io/c/:splat"
	}, {
		from: "/issue/*"
		to:   "https://github.com/cue-lang/cue/issues/:splat"
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
		// Include a top-level shortcut to list all open projects starting with the newest,
		// as the default list view for GitHub sorts by activity and shows the private templates.
		from: "/projects/"
		to:   "https://github.com/orgs/cue-lang/projects?query=is%3Aopen+sort%3Acreated-desc+is%3Apublic"
	}, {
		from: "/project/*"
		to:   "https://github.com/orgs/cue-lang/projects/:splat"
	}, {
		from: "/projects/*"
		to:   "https://github.com/orgs/cue-lang/projects/:splat"
	}, {
		from: "/releases/*"
		to:   "https://github.com/cue-lang/cue/releases/:splat"
	}, {
		from: "/s/community-calendar"
		to:   "https://calendar.google.com/calendar/u/0?cid=Y19lNzkxMWQ5OWQ4ZGIyMmU2ZTVjMzhkMTVkNjY2ZTVlNjdiNWE5ODNkZWU4N2JmNTU2NDY3NzI1OGIxYjJhMTFhQGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20"
	}, {
		from: "/docs/tour/basics/"
		to:   "/docs/tour/basics/json-superset/"
	}, {
		from: "/docs/tour/types/"
		to:   "/docs/tour/types/types/"
	}, {
		from: "/docs/tour/references/"
		to:   "/docs/tour/references/scopes/"
	}, {
		from: "/docs/tour/expressions/"
		to:   "/docs/tour/expressions/operators/"
	}, {
		from: "/docs/tour/packages/"
		to:   "/docs/tour/packages/packages/"
	},
		// These old-site path globs deliberately don't include a trailing slash,
		// so as to catch the slashless "/docs/foo" path by itself.
		// They don't redirect to a specific page, but to the section index.
		{
			from:   "/docs/usecases*"
			to:     "/docs/concept/popular-guides/#common-use-cases"
			status: 301
		}, {
			from:   "/docs/integrations*"
			to:     "/docs/integration/"
			status: 302 // We'll reuse this path, later.
		}, {
			from:   "/docs/concepts*"
			to:     "/docs/concept/"
			status: 301
		}, {
			from:   "/docs/references*"
			to:     "/docs/reference/"
			status: 301
		},
		// The old-site tour paths /do/ preserve trailing path elements.
		{
			from:   "/docs/tutorials/tour/intro/*"
			to:     "/docs/tour/basics/:splat"
			status: 301
		}, {
			from:   "/docs/tutorials/tour/intro"
			to:     "/docs/tour/basics/"
			status: 301
		}, {
			from:   "/docs/tutorials/tour/types/*"
			to:     "/docs/tour/types/:splat"
			status: 301
		}, {
			from:   "/docs/tutorials/tour/types"
			to:     "/docs/tour/types/"
			status: 301
		}, {
			from:   "/docs/tutorials/tour/references/*"
			to:     "/docs/tour/references/:splat"
			status: 301
		}, {
			from:   "/docs/tutorials/tour/references"
			to:     "/docs/tour/references/"
			status: 301
		}, {
			from:   "/docs/tutorials/tour/expressions/*"
			to:     "/docs/tour/expressions/:splat"
			status: 301
		}, {
			from:   "/docs/tutorials/tour/expressions"
			to:     "/docs/tour/expressions/"
			status: 301
		}, {
			from:   "/docs/tutorials/tour/packages/*"
			to:     "/docs/tour/packages/:splat"
			status: 301
		}, {
			from:   "/docs/tutorials/tour/packages"
			to:     "/docs/tour/packages/"
			status: 301
		}, {
			from: "/s/slack"
			to:   "https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE"
		}, {
			from: "/s/discord"
			to:   "https://discord.gg/CBUzN6CrRa"
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

#toRedirects: {
	#input: #config
	let tmpl = """
		###############################################
		# set server-side redirects in this file      #
		# see https://www.netlify.com/docs/redirects/ #
		# test at https://play.netlify.com/redirects  #
		###############################################

		# Redirect golang vanity imports for cuelang.org
		/go/* go-get=1 /golang/go.html 200

		# Redirect default Netlify subdomain to primary domain
		https://cue.netlify.com/* https://cuelang.org/:splat 301!
		https://cuelang.org/docs/concepts/intro/ https://cuelang.org/docs/concepts/logic/ 301!

		# Netlify redirects. See https://www.netlify.com/docs/redirects/
		{{ `{{ range $p := .Site.Pages -}}` }}
		{{ `{{ range .Aliases }}` }}
		{{ `{{  . | printf "%-35s" }}	{{ $p.RelPermalink -}}` }}
		{{ `{{ end -}}` }}
		{{ `{{- end -}}` }}
		"""

	template.Execute(tmpl, #input)
}
