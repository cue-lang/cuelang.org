package command

import (
	"encoding/json"
	"strings"
)

contentRoot: "content/docs/reference/command"
_cuePathBase: {
	_input: string
	// align this path's prefix with contentRoot
	content: docs: reference: command: (_input): page: {}
}

#CueCommand: {
	dir!:     string & =~#"^[a-zA-Z0-9-]+$"#
	title!:   string
	execCmd!: string
	cuePath!: string
	// TODO: use site.cue's canonical data for these values (from the keys of
	// versions["cue"]) when a solution to the panic captured at
	// https://cuelang.org/cl/1209140 is available.
	cueVersion!:   "latest" | "tip" | "prerelease"
	experimental!: bool
	introduction!: string
	tagSet!: [string]: true // true is chosen over top purely to produce concrete data.
	tagList!: [...]
	relatedCommands!: [...string]
}

cue: [SubCommand=string]: #CueCommand & {
	_dirSuffix:   strings.Replace(SubCommand, " ", "-", -1)
	dir:          *"cue-help-\(_dirSuffix)" | _
	execCmd:      *"cue help \(SubCommand)" | _
	title:        *"cue help \(SubCommand)" | _
	cueVersion:   *"latest" | _
	experimental: *false | _
	introduction: *"" | _
	tagSet: *{} | _
	tagList: [for tag, _ in tagSet {tag}]
	relatedCommands: *[] | _
	cuePath: json.Marshal(_cuePathBase & {
		_input: dir
	})
}

// Exceptions to the defaults
cue: {
	cue: {
		dir:     "cue-help"
		execCmd: "cue help"
		title:   "cue help"
	}
	[=~"^exp "]: experimental: true
	"mod mirror": {
		cueVersion:   "prerelease"
		experimental: true
	}
	refactor: cueVersion: "prerelease"
	"refactor imports": {
		cueVersion:   "prerelease"
		experimental: true
	}
}

// Introduce experimental and unreleased commands.
cue: [_]: {
	experimental: _
	cueVersion:   _
	let tip = (cueVersion == "tip")
	let prerelease = (cueVersion == "prerelease")
	let unreleased = tip || prerelease

	if experimental || unreleased {
		introduction: strings.Join([
			"{{<info>}}",
			if tip {"This command is not yet available in the latest CUE release."},
			if prerelease {"""
				This command is only available in a recent CUE
				[pre-release]({{<relref"docs/introduction/installation/#download-an-official-cue-binary">}}).
				"""},
			if unreleased && experimental {"\n"},
			if experimental {"This command is still in an experimental stage -- it may be changed or removed at any time."},
			"{{</info>}}",
		], "\n")
	}
}

// Hugo page tags
cue: {
	[_]: tagSet: "cue command": _
	// This can't be reduced to a more general comprehension over the keys of the
	// tags.cue field because https://cuelang.org/issues/2013 strikes.
	[or(tags.cue.modules)]: tagSet: modules: _
}
// Ensure that all tagged pages exist as actual pages.
tags: "cue": [_]: [...or([for command, _ in cue {command}])]
tags: cue: {
	modules: [
		"login",
		"mod",
		"mod edit",
		"mod fix",
		"mod get",
		"mod init",
		"mod publish",
		"mod resolve",
		"mod tidy",
		"modules",
		"registryconfig",
	]
}

// Related "docs/reference/command/" pages, manually extracted from help text
// contents.
cue: {
	mod: relatedCommands: [
		"cue help modules",
		"cue help mod edit",
		"cue help mod fix",
		"cue help mod get",
		"cue help mod init",
		"cue help mod publish",
		"cue help mod rename",
		"cue help mod resolve",
		"cue help mod tidy",
	]
	"mod get": relatedCommands: [
		"cue help environment",
	]
	"mod publish": relatedCommands: [
		"cue help environment",
	]
	"mod resolve": relatedCommands: [
		"cue help registryconfig",
	]
	"mod tidy": relatedCommands: [
		"cue help environment",
	]
	modules: relatedCommands: [
		"cue help mod",
		"cue help registryconfig",
	]
}

// All commands
cue: close({
	cue:                _
	cmd:                _
	commands:           _
	completion:         _
	def:                _
	embed:              _
	environment:        _
	eval:               _
	exp:                _
	"exp gengotypes":   _
	export:             _
	filetypes:          _
	fix:                _
	flags:              _
	fmt:                _
	get:                _
	"get go":           _
	import:             _
	injection:          _
	inputs:             _
	login:              _
	mod:                _
	"mod edit":         _
	"mod fix":          _
	"mod get":          _
	"mod init":         _
	"mod mirror":       _
	"mod publish":      _
	"mod rename":       _
	"mod resolve":      _
	"mod tidy":         _
	modules:            _
	refactor:           _
	"refactor imports": _
	registryconfig:     _
	trim:               _
	version:            _
	vet:                _
})
