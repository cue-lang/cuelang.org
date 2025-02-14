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
	dir!:          string & =~#"^[a-zA-Z0-9-]+$"#
	title!:        string
	execCmd!:      string
	cuePath!:      string
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
	[=~"^exp "]: introduction: _warningExperimental
}

_warningExperimental: """
	{{<warning>}}
	This command is still in an experimental stage, which means that it may be
	changed or removed at any time.
	The objective is for the CUE project to gain experience and feedback from
	this experimental command, and then move the feature elsewhere.
	{{</warning>}}
	"""

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
cue: close({
	cue:              _
	cmd:              _
	commands:         _
	completion:       _
	def:              _
	embed:            _
	environment:      _
	eval:             _
	exp:              _
	"exp gengotypes": _
	export:           _
	filetypes:        _
	fix:              _
	flags:            _
	fmt:              _
	get:              _
	"get go":         _
	import:           _
	injection:        _
	inputs:           _
	login:            _
	mod:              _
	"mod edit":       _
	"mod fix":        _
	"mod get":        _
	"mod init":       _
	"mod publish":    _
	"mod resolve":    _
	"mod tidy":       _
	modules:          _
	registryconfig:   _
	trim:             _
	version:          _
	vet:              _
})
