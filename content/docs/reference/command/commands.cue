package command

import (
	"strings"
	"encoding/json"
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
	tagSet!: [string]: true // true is chosen over top purely to produce concrete data.
	tagList!: [...]
	relatedCommands!: [...string]

	// oldDir is used to populate the page-level "aliases" front matter key,
	// temporarily, until our logs show us that few enough inbound links reach
	// the "old" URL paths (/docs/reference/cli/cue-foo); after which point it
	// (and the aliases it drives (in /site.cue)) can be removed.
	oldDir!: string
}

cue: [SubCommand=string]: #CueCommand & {
	_dirSuffix: strings.Replace(SubCommand, " ", "-", -1)
	dir:        *"cue-help-\(_dirSuffix)" | _
	execCmd:    *"cue help \(SubCommand)" | _
	title:      *"cue help \(SubCommand)" | _
	oldDir:     *"cue-\(_dirSuffix)" | _
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
		oldDir:  "cue"
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
cue: {
	cue:            _
	cmd:            _
	commands:       _
	completion:     _
	def:            _
	embed:          _
	environment:    _
	eval:           _
	export:         _
	filetypes:      _
	fix:            _
	flags:          _
	fmt:            _
	get:            _
	"get go":       _
	import:         _
	injection:      _
	inputs:         _
	login:          _
	mod:            _
	"mod edit":     _
	"mod fix":      _
	"mod get":      _
	"mod init":     _
	"mod publish":  _
	"mod resolve":  _
	"mod tidy":     _
	modules:        _
	registryconfig: _
	trim:           _
	version:        _
	vet:            _
}
