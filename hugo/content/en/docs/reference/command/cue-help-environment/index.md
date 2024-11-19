---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help environment"
aliases: ["/docs/reference/cli/cue-environment/"]
weight: 1000
tags:
- cue command
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgZW52aXJvbm1lbnQ=" }
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
		Comma-separated list of experiment flags to enable or disable:

		evalv3
			Enable the new CUE evaluator, addressing performance issues
			and bringing a better disjunction algorithm.
		embed
			Enable support for embedded data files as described in
			https://cuelang.org/discussion/3264.
		decodeint64
			Tweak cue.Value.Decode to choose "int64" rather than "int"
			as the default Go type for CUE integer values.

	CUE_DEBUG
		Comma-separated list of debug flags to enable or disable, such as:

		http
			Log a JSON message per HTTP request and response made
			when interacting with module registries.

CUE_EXPERIMENT and CUE_DEBUG are comma-separated lists of key-value strings,
where the value is a boolean "true" or "1" if omitted. For example:

	CUE_EXPERIMENT=toenable,todisable=0

```
