package site

import (
	"github.com/cue-lang/tmp/internal/ci/base"
	"strings"
	"list"
	"github.com/cue-lang/cuelang.org/internal/ci"
	"github.com/cue-lang/cuelang.org/content/docs/reference/command"
	"encoding/yaml"
	"github.com/cue-lang/cuelang.org/internal/ci/repo"
)

let donotedit = base.doNotEditMessage & {
	_
	#generatedBy: "site_tool.cue"
}
versions: {
	let versionSet = {
		for _, v in cue {
			"\(v.v)": true
		}
	}
	go:            "go1.25.0"
	bareGoVersion: strings.TrimPrefix(go, "go")
	cue: {
		[x=string]: var: "CUELANG_CUE_\(strings.ToUpper(x))"
		latest: {
			v:             *"v0.14.1" | _
			majorDotMinor: strings.Join(list.Take(strings.Split(v, "."), 2), ".")
		}
		prerelease: v: *latest.v | _
		tip: v:        *latest.v | _
		default: v:    latest.v
		playground: v: latest.v
	}
	_cueVersionList: list.SortStrings([
		for k, _ in versionSet {
			k
		}])
	testscript:  "v1.13.1"
	libcue:      "1c861cc9cdc5584f5d26b0a7112aa2afee74d4cf"
	cueApiJava:  "3c12bb9e9ea203d4de8308b4145e876e4b60207e"
	staticcheck: "v0.6.0"

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
site: {
	config: {
		baseURL:                              "/"
		title:                                "CUE"
		publishDir:                           "../_public"
		defaultContentLanguage:               "en"
		defaultContentLanguageInSubdir:       false
		enableMissingTranslationPlaceholders: true
		enableRobotsTXT:                      true
		enableGitInfo:                        true
		disableKinds: ["RSS", "taxonomy", "term"]
		disableAliases: false
		imaging: {
			resampleFilter: "CatmullRom"
			quality:        75
			anchor:         "smart"
		}
		outputs: {
			home: ["HTML", "RSS", "REDIR", "Algolia", "aliases"]
			section: ["HTML"]
		}
		outputFormats: {
			RSS: baseName: "feed"
			REDIR: {
				mediatype:      "text/netlify"
				baseName:       "_redirects"
				isPlainText:    true
				notAlternative: true
			}
			Algolia: {
				baseName:       "algolia"
				isPlainText:    true
				mediaType:      "application/json"
				notAlternative: true
			}
			aliases: {
				baseName:       "aliases"
				mediaType:      "notARealMediaType/cue"
				isPlainText:    true
				notAlternative: true
			}
		}
		mediaTypes: {
			"text/netlify": delimiter: ""
			"notARealMediaType/cue": suffixes: ["cue"]
		}
		build: noJSConfigInAssets: true
	}
	languages: en: {
		languageName:      "English"
		contentDir:        "content/en"
		languageDirection: "ltr"
		title:             "CUE"
		params: {
			description: "Validate and define text-based and dynamic configuration"
			time_format: "January 2, 2006"
		}
		weight: 1
	}
	markup: {
		defaultMarkdownHandler: "goldmark"
		goldmark: {
			extensions: {
				definitionList: true
				footnote:       true
				linkify:        true
				strikethrough:  true
				table:          true
				taskList:       true
				typographer:    true
			}
			parser: {
				autoHeadingID: true
				attribute: {
					block: true
					title: true
				}
				autoHeadingIDType: "github"
			}
			renderer: {
				hardWraps: false
				unsafe:    true
				xhtml:     false
			}
		}
		highlight: {
			style:              "trac"
			lineNumbersInTable: false
		}
		tableOfContents: {
			endLevel:   2
			ordered:    false
			startLevel: 2
		}
	}
	params: {
		// Fallback Twitter card image (if not set on page).
		images: ["img/social.png"]

		// The GitHub repo associated with this site
		github_repo: "https://github.com/cue-lang/cuelang.org"

		// The base URL of the "live" site. This is used as the basis for URLs for
		// 'rel="canonical"' links.
		//
		// Note this is distinct from the Hugo-native config parameter baseURL (used
		// as .Site.BaseURL). .Site.BaseURL is the target of the current deploy.
		// We have multiple different deploy targets including tip.cuelang.org,
		// CL previews, PR previews, and the "live" site. Hence .Site.BaseURL
		// will vary based on that deploy target, but canonicalUrlPrefix will
		// not.
		//
		// Hence the case where .Site.BaseURL and .Site.Params.canonicalUrlPrefix
		// are equal can be used as "we are deploying the live site", and inequality
		// covers all other cases.
		//
		// The constraint on requiring a '/' suffix is a function of the lack of
		// URL-handling functions within Hugo. Enforcing a trailing '/' makes our
		// handling of .Site.Params.canonicalUrlPrefix cleaner elsewhere
		// (.Site.BaseURL automatically normalises the configured base URL to add a
		// trailing slash)
		canonicalUrlPrefix: strings.HasSuffix("/") & {
			"https://cuelang.org/"
		}

		// Google Custom Search Engine ID. GCS is disabled if not present.
		gcs_engine_id: "004591905419617723008:8rmik2a7xb3"
		// Which logo to use in the main header.
		logo: "svg/logo.svg"

		// Site-wide notification-bar.
		notification: {
			type: "cue-minor-release-\(versions.cue.latest.majorDotMinor)"
			// Omitting the button field removes the bar's button entirely.
			button: {
				link: "/docs/introduction/installation/"
				icon: "download"
				text: "Install CUE"
			}
			// Markdown is permitted in the content field.
			content: "**CUE \(versions.cue.latest.majorDotMinor) is now available** -- learn more about its [new features and improvements](https://github.com/cue-lang/cue/releases/tag/\(versions.cue.latest.majorDotMinor).0)"
		}

		// The tag order in this file determines their relative positions at
		// the top and bottom of all rendered pages.
		#tag: {
			name:  string
			color: "red" | "orange" | "green" | "pink" | "purple" | "lilac" | "blue" | "lavender"
		}
		tags: [...#tag] & [{
			name:  "ecosystem"
			color: "red"
		}, {
			name:  "encodings"
			color: "green"
		}, {
			name:  "cue command"
			color: "purple"
		}, {
			name:  "language"
			color: "blue"
		}, {
			name:  "validation"
			color: "lilac"
		}, {
			name:  "tooling"
			color: "orange"
		}, {
			name:  "commented cue"
			color: "pink"
		}, {
			name:  "user question"
			color: "red"
		}, {
			name:  "modules"
			color: "red"
		}, {
			name:  "go api"
			color: "lavender"
		}, {
			name:  "java api"
			color: "blue"
		}, {
			name:  "workflow command"
			color: "blue"
		}]
	}
	i18n: {
		ui_skip_nav: other:                     "Skip to content"
		ui_branding_title: other:               "Homepage of CUE"
		ui_read_more: other:                    "Read more"
		ui_min_read: other:                     "min. read"
		ui_loading: other:                      "Loading"
		ui_close: other:                        "Close"
		ui_menu: other:                         "Menu"
		ui_menu_open: other:                    "Show menu"
		ui_menu_close: other:                   "Hide menu"
		ui_menu_main: other:                    "Main menu"
		ui_menu_mobile: other:                  "Mobile menu"
		ui_menu_footer: other:                  "Footer menu"
		ui_menu_legal: other:                   "Legal"
		ui_menu_social: other:                  "Social"
		ui_sidemenu: other:                     "Side navigation"
		ui_sidemenu_open: other:                "Show side navigation"
		ui_sidemenu_close: other:               "Hide side navigation"
		ui_legalmenu_issue_report: other:       "Report an Issue"
		ui_pager_name_prevnext: other:          "Previous/Next navigation"
		ui_pager_name_pages: other:             "Pagination"
		ui_pager_prev: other:                   "Previous"
		ui_pager_next: other:                   "Next"
		ui_pager_first: other:                  "First"
		ui_pager_last: other:                   "Last"
		post_byline_by: other:                  "By"
		post_created: other:                    "Created"
		post_last_mod: other:                   "Last modified"
		post_report_problem: other:             "Report a problem"
		docs_show_nav: other:                   "Show navigation"
		docs_coming_soon: other:                "this page will be coming soon"
		redirect_title: other:                  "Redirecting..."
		redirect_manually: other:               "Click here if you are not redirected"
		error_404_title: other:                 "{ status: 404, message: \"Page not found\" }"
		error_404_description: other:           "Oops! This page doesn't exist.<br><br>\nTry going back to our <strong><a href=\"/\">home page</a></strong>,\ntaking a look at our <strong><a href=\"/docs/\">documentation</a></strong>,\nor <a href=\"/search\">searching for a page</a></strong>.\n"
		search_title: other:                    "Search"
		search_question: other:                 "What are you looking for?"
		search_results: other:                  "documents found"
		search_filters_title: other:            "Filters"
		search_placeholder: other:              "Search in cuelang.org"
		search_placeholder_content_type: other: "Search in {{ .contentType }}"
		search_tags_title: other:               "Tags"
		search_tags_heading: other:             "Filter by tags"
		search_tags_input: other:               "Filter tags"
		"search_tags_no-results": other:        "No tags found"
		search_contentType_title: other:        "Content Type"
		search_contentType_heading: other:      "Filter by Content Type"
		search_contentType_input: other:        "Filter Content Type"
		"search_contentType_no-results": other: "No Content Type's found"
		logo_redirect: other:                   "Go to the website"
		copy_title: other:                      "Copy code"
		copy_filename: other:                   "Copy filename"
		copy_message: other:                    "Copied!"
		author_github: other:                   "Github profile"
		author_search: other:                   "Search all content by this author"
		share_open: other:                      "Open share options"
		share_copy_link: other:                 "Copy link"
		share_share_on: other:                  "Share on"
		popup_open: other:                      "Open popup"
		popup_close: other:                     "Close popup"
	}
	menus: en: {
		main: [{
			identifier: "docs"
			name:       "Documentation"
			url:        "/docs/"
			weight:     100
		}, {
			identifier: "play"
			name:       "Play"
			url:        "/play/"
			weight:     101
		}, {
			identifier: "community"
			name:       "Community"
			url:        "/community/"
			weight:     102
		}]
		icons: [{
			identifier: "github"
			name:       "GitHub"
			url:        "https://github.com/cue-lang/cue"
			pre:        "github"
			weight:     200
		}, {
			identifier: "slack"
			name:       "Slack"
			url:        "/s/slack"
			pre:        "slack"
			weight:     201
		}, {
			identifier: "discord"
			name:       "Discord"
			url:        "/s/discord"
			pre:        "social-discord"
			weight:     202
		}, {
			identifier: "x-twitter"
			name:       "X (Twitter)"
			url:        "https://twitter.com/cue_lang"
			pre:        "social-x"
			weight:     203
		}, {
			identifier: "bluesky"
			name:       "Bluesky"
			url:        "https://bsky.app/profile/cuelang.org"
			pre:        "social-bluesky"
			weight:     204
		}, {
			identifier: "youtube"
			name:       "YouTube"
			url:        "https://www.youtube.com/@cuelang/videos"
			pre:        "social-youtube"
			weight:     205
		}]
		cta: [{
			identifier: "cta"
			name:       "Install"
			url:        "/docs/introduction/installation/"
			post:       "download"
			weight:     300
		}]
		footer: [{
			identifier: "column1"
			name:       "Get Started"
			url:        "#"
			weight:     400
		}, {
			parent: "column1"
			name:   "Documentation"
			url:    "/docs/"
			weight: 410
		}, {
			parent: "column1"
			name:   "Language Tour"
			url:    "/docs/tour/"
			weight: 411
		}, {
			parent: "column1"
			name:   "Playground"
			url:    "/play/"
			weight: 412
		}, {
			parent: "column1"
			name:   "Install CUE"
			url:    "/docs/introduction/installation/"
			weight: 413
		}, {
			identifier: "column2"
			name:       "Community"
			url:        "#"
			weight:     401
		}, {
			parent: "column2"
			name:   "The CUE Community"
			url:    "/community"
			weight: 420
		}, {
			parent: "column2"
			name:   "Contributing"
			url:    "https://github.com/cue-lang/cue/blob/master/CONTRIBUTING.md#contribution-guide"
			weight: 421
		}, {
			parent: "column2"
			name:   "Code of Conduct"
			url:    "/docs/reference/code-of-conduct/"
			weight: 422
		}, {
			parent: "column2"
			name:   "Slack Workspace"
			url:    "/s/slack"
			weight: 423
		}, {
			parent: "column2"
			name:   "Discord Server"
			url:    "/s/discord"
			weight: 424
		}, {
			identifier: "column4"
			name:       "Connect"
			url:        "#"
			weight:     403
		}, {
			parent: "column4"
			name:   "GitHub"
			url:    "https://github.com/cue-lang/cue"
			weight: 440
		}, {
			parent: "column4"
			name:   "X (Twitter)"
			url:    "https://twitter.com/cue_lang"
			weight: 443
		}, {
			parent: "column4"
			name:   "Bluesky"
			url:    "https://bsky.app/profile/cuelang.org"
			weight: 444
		}, {
			parent: "column4"
			name:   "YouTube"
			url:    "https://www.youtube.com/@cuelang/videos"
			weight: 445
		}]
		legal: [{
			identifier: "privacy"
			name:       "Privacy policy"
			url:        "/privacy-policy/"
			weight:     501
		}]
	}
}

// baseEnv provides the base environment for code node or multi-step scripts on
// the site. Any guide can in theory override this base, by setting a different
// value "on page".
baseEnv: {
	{
		[string]: string
	}
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
		comparators: *[{
			kind:    "patternComparator"
			command: "go test"
			pattern: expr: #"(?m)^ok .*\t(\d(\.\d+)?)s"#
		}] | _
		sanitisers: *[{
			kind:    "patternSanitiser"
			command: "go version"
			pattern: expr: #"(?m)linux\/.+$"#
			replacement: "linux/amd64"
		}, {
			kind:    "patternSanitiser"
			command: "cue version"
			pattern: expr: #"(?m)GOARCH .+$"#
			replacement: "GOARCH amd64"
		}, {
			kind:    "patternSanitiser"
			command: "cue version"
			pattern: expr: #"(?m)GOOS .+$"#
			replacement: "GOOS linux"
		}, {
			kind:    "patternSanitiser"
			command: "cue version"
			pattern: expr: #"(?m)^\s*GOAMD64 .*\n"#
			replacement: ""
		}, {
			kind:    "patternSanitiser"
			command: "cue version"
			pattern: expr: #"(?m)^\s*GOARM64 .*\n"#
			replacement: ""
		}] | _
	}
}
content: _contentDefaults

// template is an io/fs.FS-like map of files that are templated
// by site_tool.cue:gen for the working of cuelang.org
template: ci.#writefs & {
	let configDefault = "hugo/config/_default"
	Tool: "site_tool.cue"
	Remove: ["content/docs/reference/command/cue-help*/*.md", "\(configDefault)/*.toml", "\(configDefault)/menus/*.toml"]
	#RunGoCommand: {
		"""
			RUN \\
			  --mount=type=cache,target=/cache/gocache \\
			  --mount=type=cache,target=/cache/gomodcache \\
			  export GOCACHE=/cache/gocache GOMODCACHE=/cache/gomodcache && \\
			  \(#cmd)
			"""
		#cmd: string
	}
	Create: {
		"internal/cmd/preprocessor/cmd/_docker/Dockerfile": Contents: """
						# syntax=docker/dockerfile:1

						# \(donotedit)

						FROM golang:\(versions.bareGoVersion) AS build

						ARG GOPRIVATE
						ENV GOPRIVATE=$GOPRIVATE

						ENV CGO_ENABLED=0

						# TODO: mount the caches from the host system, having first established and
						# switched to a user with the same UID and GID as the caller.

						# Dump our environment for logging purposes
						\(#RunGoCommand & {
			_
			#cmd: "go env"
		})

						# Build preprocessor and page dependencies
						\(#RunGoCommand & {
			_
			#cmd: "go install -trimpath github.com/rogpeppe/go-internal/cmd/testscript@\(versions.testscript)"
		})
						\(#RunGoCommand & {
			_
			#cmd: "go install -trimpath honnef.co/go/tools/cmd/staticcheck@\(versions.staticcheck)"
		})

						RUN mkdir /cues

						\(strings.Join([for _, version in versions._cueVersionList {
			#RunGoCommand & {
				_
				#cmd: "GOBIN=/cues/\(version) go install -trimpath cuelang.org/go/cmd/cue@\(version)"
			}
		}], """



			"""))

						RUN git clone https://github.com/cue-lang/libcue.git /libcue
						RUN git -C /libcue reset --hard \(versions.libcue)
						\(#RunGoCommand & {
			_
			#cmd: "CGO_ENABLED=1 go build -C /libcue -o libcue.so -buildmode=c-shared"
		})

						FROM golang:\(versions.bareGoVersion)

						RUN apt-get update && apt-get install -y tree

						RUN mkdir -p /go/bin

						ENV LC_ALL=C.UTF-8

						# Default to the default value of CUE. Guides can fix to a different
						# version explicitly
						ENV PATH="/cues/\(versions.cue.default.v):${PATH}"

						ENV PATH="/go/bin:/usr/local/go/bin:${PATH}"
						\(strings.Join([for _, version in versions.cue {
			"ENV \(version.var)=\"\(version.v)\""
		}], """


			"""))

						WORKDIR /

						COPY ./testscript.sh /usr/bin/testscript.sh
						RUN chmod 755 /usr/bin/testscript.sh

						COPY ./entrypoint.sh /usr/bin/entrypoint.sh
						RUN chown root:root /usr/bin/entrypoint.sh
						RUN chmod 755 /usr/bin/entrypoint.sh
						RUN chown root:root /usr/bin/entrypoint.sh

						COPY --from=build /go/bin/testscript /go/bin
						COPY --from=build /go/bin/staticcheck /go/bin
						\(strings.Join([for _, version in versions._cueVersionList {
			"COPY --from=build /cues/\(version)/cue /cues/\(version)/cue"
		}], """


			"""))

						COPY --from=build /libcue/libcue.so /usr/local/lib/
						ENV LD_LIBRARY_PATH="/usr/local/lib"

						ENV JAVA_HOME=/opt/java/openjdk
						COPY --from=\(versions.java.image)\(versions.java.pin) $JAVA_HOME $JAVA_HOME
						# Extending PATH here is insufficient; see the TODO in
						# ./internal/cmd/preprocessor/cmd.buildMultistepScript
						ENV PATH="${JAVA_HOME}/bin:${PATH}"

						ENV MAVEN_HOME=/usr/share/maven
						COPY --from=\(versions.maven.image)\(versions.maven.pin) $MAVEN_HOME $MAVEN_HOME
						COPY --from=\(versions.maven.image)\(versions.maven.pin) /usr/local/bin/mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
						COPY --from=\(versions.maven.image)\(versions.maven.pin) $MAVEN_HOME/ref/settings-docker.xml $MAVEN_HOME/ref/settings-docker.xml
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
						RUN --mount=type=tmpfs,target=/tmpfs/ \\
						    --mount=type=cache,target=/root/.m2/ \\
						    git clone https://github.com/cue-lang/cue-api-java.git /tmpfs/cue-api-java/ \\
						 && cd /tmpfs/cue-api-java \\
						 && git reset --hard \(versions.cueApiJava) \\
						 && mvn package \\
						 && mkdir -p /usr/local/share/java/ \\
						 && cp target/CUE*.jar /usr/local/share/java/CUE.jar

						ENTRYPOINT ["/usr/bin/entrypoint.sh"]

						"""

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
		"playground/src/config/gen_cuelang_org_go_version.ts": Contents: """
						// \(donotedit)

						export const CUEVersion = '\(versions.cue.playground.v)';

						"""

		for _, cmd in command.cue {
			"\(command.contentRoot)/\(cmd.dir)/page.cue": Contents: """
									// \(donotedit)
									package site

									\(cmd.cuePath)

									"""
			"\(command.contentRoot)/\(cmd.dir)/en.md": Contents:    """
									---
									WARNING: "\(donotedit)"
									title: "\(cmd.title)"
									weight: 1000
									tags:
									\(strings.TrimSuffix(yaml.Marshal(cmd.tagList), """


				"""))
									---
									{{{with _script_ "en" "HIDDEN: access required CUE version"}}}
									export PATH=/cues/$CUELANG_CUE_\(strings.ToUpper(cmd.cueVersion)):$PATH
									{{{end}}}
									\(cmd.introduction)
									{{{with script "en" "cue cli help text"}}}
									\(cmd.execCmd)
									{{{end}}}
									\(strings.Join([if len(cmd.relatedCommands) > 0 for e in ["", "## Related content", "",
										for c in cmd.relatedCommands
										let path = strings.Replace(c, " ", "-", -1) {
					"- {{< linkto/related/reference \"command/\(path)\" >}}"
				}] {
				e
			}], """


				"""))
									"""
			"requirements.txt": Contents: """
									# \(donotedit)

									mkdocs-material==\(repo.mkdocsMaterialVersion)

									# Fork of Pygments that includes CUE syntax highlighting.
									# TODO: remove when CUE support is available upstream.
									git+https://github.com/myitcvforks/pygments.git@c4091b79f2d95c4e35fd2a890375e22105cd31cd#egg=pygments
									"""
		}
	}
}
