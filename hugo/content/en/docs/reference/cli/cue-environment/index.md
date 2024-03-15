---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue environment"
tags:
- cue command
---

```text { title="TERMINAL" codeToCopy="Y3VlIGhlbHAgZW52aXJvbm1lbnQK" }
$ cue help environment
The cue command consults environment variables for configuration.
If an environment variable is unset or empty, it uses a sensible default
setting.

	CUE_CACHE_DIR
		The directory where the cue command keeps a cache of files to be
		reused. This defaults to a directory for user-specific temporary
		cache data, such as:

			"$XDG_CACHE_HOME/cue" or "$HOME/.cache/cue" on Linux
			"$HOME/Library/Caches/cue" on MacOS
			"%LocalAppData%/cue" on Windows

	CUE_CONFIG_DIR
		The directory where the cue command keeps configuration and
		state files. This defaults to a directory for user-specific
		configuration data, such as:

			"$XDG_CONFIG_HOME/cue" or "$HOME/.config/cue" on Linux
			"$HOME/Library/Application Support/cue" on MacOS
			"%AppData%/cue" on Windows

	CUE_DEBUG
		Comma-separated list of debug flags to enable. Current possible
		values are:
			http
				Print log messages in JSON format, one per line showing
				HTTP requests and responses made when interacting with
				module registries.

	CUE_EXPERIMENT
		Comma-separated list of experiments to enable. The
		list of available experiments may change arbitrarily over time.
		See exp.go in package cuelang.org/go/internal/cueexperiment for
		currently valid values.

		Warning: This variable is provided for the development and
		testing of the cue commands itself. Use beyond that purpose is
		unsupported.

	CUE_REGISTRY

		This variable specifies which registry or registries to use for
		downloading and publishing modules. See "cue help registryconfig"
		for details.

```
