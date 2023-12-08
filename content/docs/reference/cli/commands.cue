package commands

import "strings"

contentRoot: "content/docs/reference/cli"
cuePathBase: "content: docs: reference: cli"
cuePathBase: strings.Replace(contentRoot, "/", ": ", -1)

#CueCommand: {
	dir!:     string & =~#"^[a-zA-Z0-9-]+$"#
	title!:   string
	execCmd!: string
	cuePath!: string
}

cue: [SubCommand=string]: #CueCommand & {
	_dirSuffix: strings.Replace(SubCommand, " ", "-", -1)
	dir:        _ | *"cue-\(_dirSuffix)"
	execCmd:    _ | *"cue help \(SubCommand)"
	title:      _ | *"cue \(SubCommand)"
	cuePath:    #"\#(cuePathBase): "\#(dir)""#
}

cue: {
	cue: {
		dir:     "cue"
		execCmd: "cue help"
		title:   "cue"
	}
	version: {}
	cmd: {}
	commands: {}
	completion: {}
	def: {}
	eval: {}
	export: {}
	filetypes: {}
	fix: {}
	flags: {}
	fmt: {}
	get: {}
	"get go": {}
	help: {}
	import: {}
	injection: {}
	inputs: {}
	mod: {}
	"mod init": {}
	trim: {}
	version: {}
	vet: {}
}
