package cli

import (
	"strings"
	"encoding/json"
)

contentRoot: "content/docs/reference/cli"
cuePathBase: {
	_input: string
	// align this path's prefix with contentRoot
	content: docs: reference: cli: (_input): {}
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

cue: {
	cue: {
		dir:     "cue"
		execCmd: "cue help"
		title:   "cue"
	}
	version:    _
	cmd:        _
	commands:   _
	completion: _
	def:        _
	eval:       _
	export:     _
	filetypes:  _
	fix:        _
	flags:      _
	fmt:        _
	get:        _
	"get go":   _
	help:       _
	import:     _
	injection:  _
	inputs:     _
	mod:        _
	"mod init": _
	trim:       _
	version:    _
	vet:        _
}
