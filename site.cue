package site

import (
	"list"
	"strings"

	"github.com/cue-lang/cuelang.org/internal/ci"
	"github.com/cue-lang/cuelang.org/internal/ci/base"
	"github.com/cue-lang/cuelang.org/content/docs/reference/command"
)

versions: {
	go:            "go1.22.4"
	bareGoVersion: strings.TrimPrefix(go, "go")
	cue: {
		[x=string]: var: "CUELANG_CUE_\(strings.ToUpper(x))"
		latest: v:       "v0.9.2"
		prerelease: v:   latest.v
		tip: v:          prerelease.v
		default: v:      latest.v
		playground: v:   latest.v
	}
	let versionSet = {for _, v in cue {"\(v.v)": true}}
	_cueVersionList: list.SortStrings([
		for k, _ in versionSet {k},
	])
	testscript: "v1.12.0"
}

// _contentDefaults is a recursive template for setting defaults
// on pages declared under 'content'. They are, in effect, site
// defaults, templated to each page.
_contentDefaults: {
	// See execute_doc.go for a refresher on how the site is structured
	// underneath the top level 'content' field. Wherever a page root if found,
	// there can be page configuration. That page configuration should be placed
	// at the point in the 'content' configuration tree that corresponds to the
	// path of the page (remembering that hugo supports node and leaf pages).
	// The page configuration itself for that path is placed in a field called
	// 'page'. The implication therefore is that we cannot, in our site, have a
	// directory called 'page' under the content directory, otherwise there
	// would a conflict in terms of the structure. But this is reasonable (for
	// now).
	//
	// We need _contentDefaults to apply to any page defined under the top level
	// 'content' field. Therefore we need to express the template recursively
	// taking advantage of the fact that any field that exists that is not named
	// page represents part of a path to a more nested page.
	[!="page"]: _contentDefaults
	page?: {
		leftDelim:  *"{{{" | _
		rightDelim: *"}}}" | _

		comparators: *[
			{
				kind:    "patternComparator"
				command: "go test"
				pattern: expr: #"(?m)^ok .*\t(\d(\.\d+)?)s"#
			},
		] | _

		sanitisers: *[
			{
				kind:    "patternSanitiser"
				command: "go version"
				pattern: expr: #"(?m)linux\/.+$"#
				replacement: "linux/amd64"
			},
			{
				kind:    "patternSanitiser"
				command: "cue version"
				pattern: expr: #"(?m)GOARCH .+$"#
				replacement: "GOARCH amd64"
			},
			{
				kind:    "patternSanitiser"
				command: "cue version"
				pattern: expr: #"(?m)GOOS .+$"#
				replacement: "GOOS linux"
			},
			{
				kind:    "patternSanitiser"
				command: "cue version"
				pattern: expr: #"(?m)^\s*GOAMD64 .*\n"#
				replacement: ""
			},
		] | _
	}
}
content: _contentDefaults

let donotedit = base.doNotEditMessage & {#generatedBy: "site_tool.cue", _}

// template is an io/fs.FS-like map of files that are templated
// by site_tool.cue:gen for the working of cuelang.org
template: ci.#writefs & {
	Remove: [
		// The generated artefacts from the CLI auto-generation. Do not remove
		// the cache files, because otherwise on a Preprocessor-No-Write-Cache
		// they will not get added back, a change that would, ironically, create
		// noise in a commit where we are intending there to be less noise.
		// TODO(jcm): figure out how to express "only remove auto-generated files",
		// so that a manually-added "cue-help-foo" page (which *could* exist)
		// wouldn't break the build.
		"content/docs/reference/command/cue-help*/*.md",
	]
	Create: {
		"internal/cmd/preprocessor/cmd/_docker/Dockerfile": {
			Contents: #"""
			# syntax=docker/dockerfile:1

			# \#(donotedit)

			FROM golang:\#(versions.bareGoVersion) AS build

			ENV CGO_ENABLED=0

			# TODO: mount the caches from the host system, having first established and
			# switched to a user with the same UID and GID as the caller.

			RUN \
			  --mount=type=cache,target=/cache/gocache \
			  --mount=type=cache,target=/cache/gomodcache \
			  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \
			  go install -trimpath github.com/rogpeppe/go-internal/cmd/testscript@\#(versions.testscript)

			RUN mkdir /cues

			\#(strings.Join([for _, version in versions._cueVersionList {
				#"""
					RUN \
					  --mount=type=cache,target=/cache/gocache \
					  --mount=type=cache,target=/cache/gomodcache \
					  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \
					  GOBIN=/cues/\#(version) go install -trimpath cuelang.org/go/cmd/cue@\#(version)
					"""#
			}], "\n\n"))

			FROM golang:\#(versions.bareGoVersion)

			RUN apt-get update && apt-get install -y tree

			RUN mkdir -p /go/bin

			ENV LC_ALL=C.UTF-8

			# Default to the default value of CUE. Guides can fix to a different
			# version explicitly
			ENV PATH="/cues/\#(versions.cue.default.v):${PATH}"

			ENV PATH="/go/bin:/usr/local/go/bin:${PATH}"
			\#(
				strings.Join([for _, version in versions.cue {
					"""
					ENV \(version.var)="\(version.v)"
					"""
				},
				], "\n"))

			WORKDIR /

			COPY ./testscript.sh /usr/bin/testscript.sh
			RUN chmod 755 /usr/bin/testscript.sh

			COPY ./entrypoint.sh /usr/bin/entrypoint.sh
			RUN chown root:root /usr/bin/entrypoint.sh
			RUN chmod 755 /usr/bin/entrypoint.sh
			RUN chown root:root /usr/bin/entrypoint.sh

			COPY --from=build /go/bin/testscript /go/bin
			\#(
				strings.Join([for _, version in versions._cueVersionList {
					"""
					COPY --from=build /cues/\(version)/cue /cues/\(version)/cue
					"""
				},
				], "\n"))

			ENTRYPOINT ["/usr/bin/entrypoint.sh"]

			"""#
		}
		"hugo/config/_default/params.toml": {
			Contents: #"""
			# \#(donotedit)

			# Site Params

			# Fallback Twitter card image (if not set on page)
			images = ["img/social.png"]

			# Repository configuration (URLs for in-page links to opening issues and suggesting changes)
			github_repo = "https://github.com/cue-lang/cuelang.org"

			# Google Custom Search Engine ID. Remove or comment out to disable search.
			gcs_engine_id = "004591905419617723008:8rmik2a7xb3"

			# Which logo to use in main header
			logo = "svg/logo.svg"

			# Add a site-wide notification-bar
			# Contents allows for markdown, leave out the button if you don't want a button
			[notification]
			    type = 'test'

			    content = '**Note:** documentation on this site relies on CUE \#(versions.cue.prerelease.v)'
			    [notification.button]
			        link = 'https://github.com/cue-lang/cue/releases'
			        icon = 'download'
			        text = 'Download'


			# Tags
			# The order of the tags in this file determines their relative positions
			# on all rendered pages.
			# Color can be one of: red, orange, green, pink, purple, lilac, blue, lavender

			[[tags]]
			name = "ecosystem"
			color = "red"
			[[tags]]
			name = "encodings"
			color = "green"
			[[tags]]
			name = "cue command"
			color = "purple"
			[[tags]]
			name = "language"
			color = "blue"
			[[tags]]
			name = "validation"
			color = "lilac"
			[[tags]]
			name = "tooling"
			color = "orange"
			[[tags]]
			name = "commented cue"
			color = "pink"
			[[tags]]
			name = "user question"
			color = "red"
			[[tags]]
			name = "modules"
			color = "red"
			[[tags]]
			name = "go api"
			color = "lavender"
			[[tags]]
			name = "workflow command"
			color = "blue"

			"""#
		}
		"playground/src/config/gen_cuelang_org_go_version.ts": {
			Contents: #"""
			// \#(donotedit)

			export const CUEVersion = '\#(versions.cue.playground.v)';

			"""#
		}

		for _, cmd in command.cue {
			"\(command.contentRoot)/\(cmd.dir)/page.cue": {
				Contents: #"""
					// \#(donotedit)
					package site

					\#(cmd.cuePath)

					"""#
			}
			"\(command.contentRoot)/\(cmd.dir)/en.md": {
				Contents: #"""
					---
					WARNING: "\#(donotedit)"
					title: "\#(cmd.title)"
					aliases: ["/docs/reference/cli/\#(cmd.oldDir)/"]
					weight: 1000
					tags:
					- cue command
					---

					{{{with script "en" "cue cli help text"}}}
					\#(cmd.execCmd)
					{{{end}}}

					"""#
			}
		}
	}
}
