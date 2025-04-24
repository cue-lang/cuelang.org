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
	"strings"

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
}

#redirect: {
	from!:        string
	queryString?: string
	to!:          string
	status!:      int
	robotsTxt?: {
		// Create a robots.txt Disallow: entry associated with this redirect?
		disallow!: bool
		// Disallow which path prefix?
		prefix!: string
	}
	force?: bool
}

config: #config & {
	build: {
		functions: "functions"
		publish:   "_public"
		command:   "bash _scripts/netlify.bash _scripts/build.bash"
		ignore:    "bash _scripts/netlify.bash _scripts/ignoreBuild.bash"
		environment: {
			GO_VERSION:   repo.goVersion
			NODE_VERSION: repo.nodeVersion
			HUGO_VERSION: repo.hugoVersion
		}
	}

	context: "deploy-preview": command: "\(build.command) --baseURL $DEPLOY_PRIME_URL"
	context: production: command:       "\(build.command) --baseURL https://cuelang.org"
	context: tip: command:              "\(build.command) --baseURL https://tip.cuelang.org --buildDrafts"
}

redirects: [...#redirect] & [...{
	from:   _
	force:  true
	status: *302 | ( >=300 & <=308 ) | 200
	robotsTxt: {
		// Does the redirect's "from" field ends with a known Netlify wildcard
		// form, indicating that it encodes a path hierarchy?
		let suffix = "/*"
		let hasSuffix = strings.HasSuffix(from, suffix)

		// If so, default to disallowing that hierarchy in /robots.txt.
		if hasSuffix {
			disallow: *true | _
			prefix:   *"\(strings.TrimSuffix(from, suffix))/" | _
		}

		// Else, default to not disallowing the hierarchy; but also default the
		// path prefix that /would/ be disallowed if "disallow:true" were set.
		if !hasSuffix {
			disallow: *false | _
			prefix:   *from | _
		}
	}
}]

redirects: [
	{
		// Golang vanity imports for cuelang.org. This *must* come before the
		// "/go/*"-without-query-string entry in this list, or the vanity
		// imports will break.
		from:        "/go/*"
		queryString: "go-get=1"
		to:          "/golang/go.html"
		status:      200
		force:       true
		robotsTxt: disallow: true
	}, {
		// Humans who open Go import paths in a browser.
		from:        "/go/*"
		queryString: ""
		to:          "https://pkg.go.dev/cuelang.org/go/:splat"
		status:      302
		force:       true
		robotsTxt: disallow: false // No need to duplicate the Disallow entry from above.
	}, {
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
	}, {
		from: "/docs/usecases/configuration/"
		to:   "/docs/concept/configuration-use-case/"
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
		from: "/docs/concepts/intro/"
		to:   "/docs/concept/the-logic-of-cue/"
	}, {
		from: "/docs/concepts/logic/"
		to:   "/docs/concept/the-logic-of-cue/"
	}, {
		from:   "/docs/concepts*"
		to:     "/docs/concept/"
		status: 301
	}, {
		from: "/docs/references/spec/"
		to:   "/docs/reference/spec/"
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
		robotsTxt: disallow: true
	}, {
		from: "/s/discord"
		to:   "https://discord.gg/CBUzN6CrRa"
		robotsTxt: disallow: true
	}, {
		from: "/e/v0.11-list-arithmetic"
		to:   "/docs/concept/faq/removing-list-arithmetic-operators-v0.11/"
		robotsTxt: disallow: true
	},
]

// This encodes server-side redirects in Netlify's _redirects file syntax:
// https://docs.netlify.com/routing/redirects/#syntax-for-the-redirects-file.
// Test syntax in their playground at https://play.netlify.com/redirects.
#toRedirects: {
	#input: [...#redirect]
	template.Execute(tmpl, #input)

	let tmpl = """
		# Redirects configured in internal/ci/netlify.redirects
		{{- range .}}
		{{printf "%-35s" .from}}{{with .queryString}} {{.}}{{end}} {{.to}} {{.status}}{{if .force}}!{{end}}
		{{- end}}

		# Aliases configured in the front matter of content pages, templated at build-time by Hugo.
		{{ `{{- range $p := .Site.Pages }}` }}
		{{ `{{- range .Aliases }}` }}
		{{ `{{ printf "%-35s" . }} {{ $p.RelPermalink }} 302!` }}
		{{ `{{- end }}` }}
		{{ `{{- end }}` }}
		"""
}

// This encodes the robots.txt Hugo template as a mixture of static disallow
// lines that can't be inferred from data, and data-driven paths found in
// Netlify's server-side redirects. The sitemap URL is hardcoded as we only ever
// want to cause the production site to be crawled.
#toRobotsTxt: {
	#input: [...#redirect]
	template.Execute(tmpl, #input)

	let tmpl = """
		User-agent: *
		Allow: /
		Disallow: /play/*?*id=
		Disallow: /search/
		{{- range .}}
		{{- if .robotsTxt.disallow}}
		Disallow: {{.robotsTxt.prefix}}
		{{- end}}
		{{- end}}

		Sitemap: https://cuelang.org/sitemap.xml
		"""
}
