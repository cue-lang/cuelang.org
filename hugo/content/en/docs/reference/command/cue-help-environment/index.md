---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help environment"
weight: 1000
tags:
- cue command
---
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgZW52aXJvbm1lbnQ=" }
$ cue help environment
The cue command consults environment variables for configuration.
If an environment variable is unset or empty, sensible default setting is used.

	CUE_CACHE_DIR
		A directory structure to hold files which are reused between operations.
		It defaults to a directory for user-specific temporary data, such as:

		- "$XDG_CACHE_HOME/cue" or "$HOME/.cache/cue" on Linux
		- "$HOME/Library/Caches/cue" on MacOS
		- "%LocalAppData%/cue" on Windows

		Its contents are generally read-only and include:

		- mod/download for modules fetched from registries
		- mod/extract for extracted module archives

	CUE_CONFIG_DIR
		A directory to hold configuration and long-lived state files.
		It defaults to a directory for user-specific persistent data, such as:

		- "$XDG_CONFIG_HOME/cue" or "$HOME/.config/cue" on Linux
		- "$HOME/Library/Application Support/cue" on MacOS
		- "%AppData%/cue" on Windows

	CUE_REGISTRY
		The configuration to use when downloading and publishing modules.
		See "cue help registryconfig" for details.

	CUE_EXPERIMENT
		Comma-separated list of experiment flags to enable or disable.
		See "cue help experiments" for details.

	CUE_DEBUG
		Comma-separated list of debug flags to enable or disable, such as:

		http
			http enables JSON logging per HTTP request and response made
			when interacting with module registries.
		strict
			strict sets whether extra aggressive checking should be done.
			This should typically default to true for pre-releases and default to
			false otherwise.
		logeval
			logeval sets the log level for the evaluator.
			There are currently only two levels:
			0: no logging
			1: logging
		sharing
			sharing enables structure sharing.
		sortfields
			sortfields forces fields in a struct to be sorted
			lexicographically.
		opendef
			opendef disables the check for closedness of definitions.
		toolsflow
			toolsflow causes [cuelang.org/go/tools/flow] to print a task dependency mermaid graph.
		parsertrace
			parsertrace causes [cuelang.org/go/cue/parser] to print a trace of parsed productions.

CUE_EXPERIMENT and CUE_DEBUG are comma-separated lists of key-value strings,
where the value is a boolean "true" or "1" if omitted. For example:

	CUE_EXPERIMENT=toenable,todisable=0

````

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}}
