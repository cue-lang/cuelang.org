package site

import (
	"strings"

	"github.com/cue-lang/cuelang.org/internal/ci"
	"github.com/cue-lang/cuelang.org/internal/ci/base"
)

versions: {
	go:            "go1.21.1"
	bareGoVersion: strings.TrimPrefix(go, "go")
	cue:           "v0.6.0"
	testscript:    "v1.10.0"
}

let donotedit = base.doNotEditMessage & {#generatedBy: "site_tool.cue", _}

// template is an io/fs.FS-like map of files that are templated
// by site_tool.cue:gen for the working of cuelang.org
template: ci.#writefs & {
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

			RUN \
			  --mount=type=cache,target=/cache/gocache \
			  --mount=type=cache,target=/cache/gomodcache \
			  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \
			  go install -trimpath cuelang.org/go/cmd/cue@\#(versions.cue)

			FROM debian@sha256:63d62ae233b588d6b426b7b072d79d1306bfd02a72bff1fc045b8511cc89ee09

			RUN mkdir -p /go/bin

			ENV PATH="/go/bin:${PATH}"

			WORKDIR /

			COPY ./entrypoint.sh /usr/bin/entrypoint.sh
			RUN chown root:root /usr/bin/entrypoint.sh
			RUN chmod 755 /usr/bin/entrypoint.sh
			RUN chown root:root /usr/bin/entrypoint.sh

			COPY --from=build /go/bin/testscript /go/bin
			COPY --from=build /go/bin/cue /go/bin

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
			logo = "svg/logo-alpha.svg"

			# Add a site-wide notification-bar
			# Contents allows for markdown, leave out the button if you don't want a button
			[notification]
			    type = 'test'
			    content = '**Note:** documentation on this site relies on CUE \#(versions.cue)'
			    [notification.button]
			        link = 'https://github.com/cue-lang/cue/releases'
			        icon = 'download'
			        text = 'Download'


			# Tags
			# Color can be one of: red, orange, green, pink, purple, lilac, blue, lavender

			[[tags]]
			name = "ecosystem"
			color = "red"
			weight = 10

			[[tags]]
			name = "encodings"
			color = "green"
			weight = 20

			[[tags]]
			name = "cue command"
			color = "purple"
			weight = 30

			[[tags]]
			name = "language"
			color = "blue"
			weight = 40

			[[tags]]
			name = "validation"
			color = "lilac"
			weight = 50

			[[tags]]
			name = "tooling"
			color = "orange"
			weight = 60

			[[tags]]
			name = "commented cue"
			color = "pink"
			weight = 70


			"""#
		}
		"playground/src/config/gen_cuelang_org_go_version.ts": {
			Contents: #"""
			// \#(donotedit)

			export const CUEVersion = '\#(versions.cue)';

			"""#
		}
	}
}
