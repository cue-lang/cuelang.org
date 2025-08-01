package site

import (
	"list"
	"strings"
	"encoding/yaml"

	"github.com/cue-lang/cuelang.org/internal/ci"
	"github.com/cue-lang/tmp/internal/ci/base"
	"github.com/cue-lang/cuelang.org/content/docs/reference/command"
)

versions: {
	go:            "go1.24.0"
	bareGoVersion: strings.TrimPrefix(go, "go")
	cue: {
		[x=string]: var: "CUELANG_CUE_\(strings.ToUpper(x))"
		latest: {
			v:             *"v0.14.0" | _
			majorDotMinor: strings.Join(list.Take(strings.Split(v, "."), 2), ".")
		}
		prerelease: v: *latest.v | _
		tip: v:        *latest.v | _
		default: v:    latest.v
		playground: v: latest.v
	}
	let versionSet = {for _, v in cue {"\(v.v)": true}}
	_cueVersionList: list.SortStrings([
		for k, _ in versionSet {k},
	])
	testscript: "v1.13.1"
	libcue:     "1c861cc9cdc5584f5d26b0a7112aa2afee74d4cf" // https://github.com/cue-lang/libcue
	cueApiJava: "3c12bb9e9ea203d4de8308b4145e876e4b60207e" // https://github.com/cue-lang/cue-api-java

	// Container image pinning: specify a tag with a ":" prefix, or pin to a
	// specific digest by using a "@" prefix.
	// cf. https://docs.docker.com/reference/dockerfile/#from
	java: {
		image: "docker.io/library/eclipse-temurin"
		pin:   ":22-jdk"
	}
	maven: {
		image: "docker.io/library/maven"
		pin:   ":3.9.8-eclipse-temurin-11"
	}
}

// baseEnv provides the base environment for code node or multi-step scripts on
// the site. Any guide can in theory override this base, by setting a different
// value "on page".
baseEnv: [string]: string
baseEnv: {
	CUE_EXPERIMENT: ""
	CUE_DEBUG:      ""
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
			{
				kind:    "patternSanitiser"
				command: "cue version"
				pattern: expr: #"(?m)^\s*GOARM64 .*\n"#
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
	Tool: "site_tool.cue"

	let configDefault = "hugo/config/_default"

	Remove: [
		// The generated artefacts from the CLI auto-generation. Do not remove
		// the cache files, because otherwise on a Preprocessor-No-Write-Cache
		// they will not get added back, a change that would, ironically, create
		// noise in a commit where we are intending there to be less noise.
		// TODO(jcm): figure out how to express "only remove auto-generated files",
		// so that a manually-added "cue-help-foo" page (which *could* exist)
		// wouldn't break the build.
		"content/docs/reference/command/cue-help*/*.md",

		// Remove all generated Hugo config files
		//
		// TODO: per the TODO below, we probably want a more "automated"
		// way of doing this, but being semi-explicit is fine for now.
		"\(configDefault)/*.toml",
		"\(configDefault)/menus/*.toml",
	]
	Create: {
		"internal/cmd/preprocessor/cmd/_docker/Dockerfile": Contents: #"""
			# syntax=docker/dockerfile:1

			# \#(donotedit)

			FROM golang:\#(versions.bareGoVersion) AS build

			ARG GOPRIVATE
			ENV GOPRIVATE=$GOPRIVATE

			ENV CGO_ENABLED=0

			# TODO: mount the caches from the host system, having first established and
			# switched to a user with the same UID and GID as the caller.

			# Dump our environment for logging purposes
			RUN \
			  --mount=type=cache,target=/cache/gocache \
			  --mount=type=cache,target=/cache/gomodcache \
			  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \
			  go env

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

			RUN git clone https://github.com/cue-lang/libcue.git /libcue
			RUN git -C /libcue reset --hard \#(versions.libcue)
			RUN \
				--mount=type=cache,target=/cache/gocache \
				--mount=type=cache,target=/cache/gomodcache \
				export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache CGO_ENABLED=1 && \
				go build -C /libcue -o libcue.so -buildmode=c-shared

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

			COPY --from=build /libcue/libcue.so /usr/local/lib/
			ENV LD_LIBRARY_PATH="/usr/local/lib"

			ENV JAVA_HOME=/opt/java/openjdk
			COPY --from=\#(versions.java.image)\#(versions.java.pin) $JAVA_HOME $JAVA_HOME
			# Extending PATH here is insufficient; see the TODO in
			# ./internal/cmd/preprocessor/cmd.buildMultistepScript
			ENV PATH="${JAVA_HOME}/bin:${PATH}"

			ENV MAVEN_HOME=/usr/share/maven
			COPY --from=\#(versions.maven.image)\#(versions.maven.pin) $MAVEN_HOME $MAVEN_HOME
			COPY --from=\#(versions.maven.image)\#(versions.maven.pin) /usr/local/bin/mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
			COPY --from=\#(versions.maven.image)\#(versions.maven.pin) $MAVEN_HOME/ref/settings-docker.xml $MAVEN_HOME/ref/settings-docker.xml
			# Extending PATH here is insufficient; see the TODO in
			# ./internal/cmd/preprocessor/cmd.buildMultistepScript
			ENV PATH="${MAVEN_HOME}/bin:${PATH}"

			# Building the CUE Java API (to make it available to content authors) is
			# done here, in the context of the runtime container image, because it
			# requires Maven and Java. We /could/ do this in the "build" container,
			# above, but that would require us to make Maven available in that
			# context. Given that Maven /also/ needs to be available to content
			# authors, we opt to perform the build here. To avoid polluting the
			# runtime container image with build artifacts we perform the build in a
			# tmpfs, and provide a cache mount for the default location of Maven's
			# download cache.
			RUN --mount=type=tmpfs,target=/tmpfs/ \
			    --mount=type=cache,target=/root/.m2/ \
			    git clone https://github.com/cue-lang/cue-api-java.git /tmpfs/cue-api-java/ \
			 && cd /tmpfs/cue-api-java \
			 && git reset --hard \#(versions.cueApiJava) \
			 && mvn package \
			 && mkdir -p /usr/local/share/java/ \
			 && cp target/CUE*.jar /usr/local/share/java/CUE.jar

			ENTRYPOINT ["/usr/bin/entrypoint.sh"]

			"""#

		// Hugo config files
		//
		// TODO: work out a better way of writing this out in a more
		// "automated" way, rather than needing to list files
		// individually. The need for listing them individually stems
		// from the way that hugo applies precedence to config, allowing
		// for overrides per language etc. We need to maintain our CUE in
		// such a way that we can derive that somehow, but that's not
		// an exercise for now.
		for v in ["config", "languages", "markup", "params"] {
			"\(configDefault)/\(v).toml": Contents: site[v]
		}
		for v in ["en"] {
			"\(configDefault)/menus/menus.\(v).toml": Contents: site.menus[v]
		}

		"playground/src/config/gen_cuelang_org_go_version.ts": Contents: #"""
			// \#(donotedit)

			export const CUEVersion = '\#(versions.cue.playground.v)';

			"""#

		for _, cmd in command.cue {
			"\(command.contentRoot)/\(cmd.dir)/page.cue": Contents: #"""
					// \#(donotedit)
					package site

					\#(cmd.cuePath)

					"""#
			"\(command.contentRoot)/\(cmd.dir)/en.md": Contents:    #"""
					---
					WARNING: "\#(donotedit)"
					title: "\#(cmd.title)"
					weight: 1000
					tags:
					\#(strings.TrimSuffix(yaml.Marshal(cmd.tagList), "\n"))
					---
					{{{with _script_ "en" "HIDDEN: access required CUE version"}}}
					export PATH=/cues/$CUELANG_CUE_\#(strings.ToUpper(cmd.cueVersion)):$PATH
					{{{end}}}
					\#(cmd.introduction)
					{{{with script "en" "cue cli help text"}}}
					\#(cmd.execCmd)
					{{{end}}}
					\#( strings.Join([if len(cmd.relatedCommands) > 0 for e in [
										"", "## Related content", "",
										for c in cmd.relatedCommands
										let path = strings.Replace(c, " ", "-", -1) {
					#"- {{< linkto/related/reference "command/\#(path)" >}}"#
				},
			] {e},
			], "\n"))
					"""#
		}
	}
}
