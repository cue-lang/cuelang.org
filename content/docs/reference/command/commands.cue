package command

import (
	"strings"
	"encoding/json"
)

contentRoot: "content/docs/reference/command"
cuePathBase: {
	_input: string
	// align this path's prefix with contentRoot
	content: docs: reference: command: (_input): page: {}
}

#CueCommand: {
	dir!:     string & =~#"^[a-zA-Z0-9-]+$"#
	title!:   string
	execCmd!: string
	cuePath!: string

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
	cuePath: json.Marshal(cuePathBase & {
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

// All commands
cue: {
	cue:            _
	cmd:            _
	commands:       _
	completion:     _
	def:            _
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
