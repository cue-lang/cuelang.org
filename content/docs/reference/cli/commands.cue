package cli

import (
	"strings"
	"encoding/json"
)

contentRoot: "content/docs/reference/cli"
cuePathBase: {
	_input: string
	// align this path's prefix with contentRoot
	content: docs: reference: cli: (_input): page: {}
}

#CueCommand: {
	dir!:     string & =~#"^[a-zA-Z0-9-]+$"#
	title!:   string
	execCmd!: string
	cuePath!: string
}

cue: [SubCommand=string]: #CueCommand & {
	_dirSuffix: strings.Replace(SubCommand, " ", "-", -1)
	dir:        *"cue-\(_dirSuffix)" | _
	execCmd:    *"cue help \(SubCommand)" | _
	title:      *"cue \(SubCommand)" | _
	cuePath: json.Marshal(cuePathBase & {
		_input: dir
	})
}

// Exceptions to the defaults
cue: {
	cue: {
		dir:     "cue"
		execCmd: "cue help"
		title:   "cue"
	}
	// "cue help" displays the same help text as "cue", and exists only so there
	// isn't an odd gap where a user might expect to find some meta help page.
	help: execCmd: "cue help"
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
	help:           _
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
