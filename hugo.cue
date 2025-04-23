package site

site: config: {
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
	outputFormats: {}
	outputFormats: RSS: baseName: "feed"
	outputFormats: REDIR: {
		mediatype:      "text/netlify"
		baseName:       "_redirects"
		isPlainText:    true
		notAlternative: true
	}
	outputFormats: Algolia: {
		baseName:       "algolia"
		isPlainText:    true
		mediaType:      "application/json"
		notAlternative: true
	}
	outputFormats: aliases: {
		baseName:       "aliases"
		mediaType:      "notARealMediaType/cue"
		isPlainText:    true
		notAlternative: true
	}
	mediaTypes: {}
	mediaTypes: "text/netlify": delimiter: ""
	mediaTypes: "notARealMediaType/cue": suffixes: ["cue"]
	build: noJSConfigInAssets: true
}

site: languages: {
	en: {
		languageName:      "English"
		contentDir:        "content/en"
		languageDirection: "ltr"
		title:             "CUE"
		weight:            1
	}
	en: params: {
		description: "Validate and define text-based and dynamic configuration"
		time_format: "January 2, 2006"
	}
}

site: markup: {
	defaultMarkdownHandler: "goldmark"
	goldmark: {}
	goldmark: extensions: {
		definitionList: true
		footnote:       true
		linkify:        true
		strikethrough:  true
		table:          true
		taskList:       true
		typographer:    true
	}
	goldmark: parser: {
		autoHeadingID:     true
		autoHeadingIDType: "github"
	}
	goldmark: parser: attribute: {
		block: true
		title: true
	}
	goldmark: renderer: {
		hardWraps: false
		unsafe:    true
		xhtml:     false
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

site: params: {
	// Fallback Twitter card image (if not set on page).
	images: ["img/social.png"]
	// Base URL for on-page links for reporting issues.
	github_repo: "https://github.com/cue-lang/cuelang.org"
	// Base URL for 'rel="canonical"' links
	canonicalUrlPrefix: "https://cuelang.org"
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

site: i18n: {
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

site: menus: en: {
	main: [
		{
			identifier: "docs"
			name:       "Documentation"
			url:        "/docs/"
			weight:     100
		},
		{
			identifier: "play"
			name:       "Play"
			url:        "/play/"
			weight:     101
		},
		{
			identifier: "community"
			name:       "Community"
			url:        "/community/"
			weight:     102
		},
	]
	icons: [
		{
			identifier: "github"
			name:       "GitHub"
			url:        "https://github.com/cue-lang/cue"
			pre:        "github"
			weight:     200
		},
		{
			identifier: "slack"
			name:       "Slack"
			url:        "/s/slack"
			pre:        "slack"
			weight:     201
		},
		{
			identifier: "discord"
			name:       "Discord"
			url:        "/s/discord"
			pre:        "social-discord"
			weight:     202
		},
		{
			identifier: "x-twitter"
			name:       "X (Twitter)"
			url:        "https://twitter.com/cue_lang"
			pre:        "social-x"
			weight:     203
		},
		{
			identifier: "bluesky"
			name:       "Bluesky"
			url:        "https://bsky.app/profile/cuelang.org"
			pre:        "social-bluesky"
			weight:     204
		},
		{
			identifier: "youtube"
			name:       "YouTube"
			url:        "https://www.youtube.com/@cuelang/videos"
			pre:        "social-youtube"
			weight:     205
		},
	]
	cta: [
		{
			identifier: "cta"
			name:       "Install"
			url:        "/docs/introduction/installation/"
			post:       "download"
			weight:     300
		},
	]
	footer: [
		{
			identifier: "column1"
			name:       "Get Started"
			url:        "#"
			weight:     400
		},
		{
			parent: "column1"
			name:   "Documentation"
			url:    "/docs/"
			weight: 410
		},
		{
			parent: "column1"
			name:   "Language Tour"
			url:    "/docs/tour/"
			weight: 411
		},
		{
			parent: "column1"
			name:   "Playground"
			url:    "/play/"
			weight: 412
		},
		{
			parent: "column1"
			name:   "Install CUE"
			url:    "/docs/introduction/installation/"
			weight: 413
		},
		{
			identifier: "column2"
			name:       "Community"
			url:        "#"
			weight:     401
		},
		{
			parent: "column2"
			name:   "The CUE Community"
			url:    "/community"
			weight: 420
		},
		{
			parent: "column2"
			name:   "Contributing"
			url:    "https://github.com/cue-lang/cue/blob/master/CONTRIBUTING.md#contribution-guide"
			weight: 421
		},
		{
			parent: "column2"
			name:   "Code of Conduct"
			url:    "/docs/reference/code-of-conduct/"
			weight: 422
		},
		{
			parent: "column2"
			name:   "Slack Workspace"
			url:    "/s/slack"
			weight: 423
		},
		{
			parent: "column2"
			name:   "Discord Server"
			url:    "/s/discord"
			weight: 424
		},
		{
			identifier: "column4"
			name:       "Connect"
			url:        "#"
			weight:     403
		},
		{
			parent: "column4"
			name:   "GitHub"
			url:    "https://github.com/cue-lang/cue"
			weight: 440
		},
		{
			parent: "column4"
			name:   "X (Twitter)"
			url:    "https://twitter.com/cue_lang"
			weight: 443
		},
		{
			parent: "column4"
			name:   "Bluesky"
			url:    "https://bsky.app/profile/cuelang.org"
			weight: 444
		},
		{
			parent: "column4"
			name:   "YouTube"
			url:    "https://www.youtube.com/@cuelang/videos"
			weight: 445
		},
	]
	legal: [
		{
			identifier: "copyright"
			name:       "Copyright"
			url:        "#"
			weight:     500
		},
		{
			identifier: "privacy"
			name:       "Privacy policy"
			url:        "#"
			weight:     501
		},
	]

}
