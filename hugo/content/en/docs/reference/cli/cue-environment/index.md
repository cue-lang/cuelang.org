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

	CUE_CONFIG_DIR
		The directory where the cue command keeps configuration and state files.
		This defaults to a directory for user-specific configuration data, such as:

			"$XDG_CONFIG_HOME/cue" or "$HOME/.config/cue" on Linux
			"$HOME/Library/Application Support" on MacOS
			"%AppData%/cue" on Windows

	CUE_REGISTRY
		A comma-separated list specifying which registry to use for
		downloading and publishing modules. A registry is specifed
		as follows:

			[modulePrefix=]hostname[:port][/repoPrefix][+insecure]

		The optional modulePrefix specifes that all modules with the
		given prefix wil use the associated registry. If there are
		multiple registries with a prefix, the longest matching prefix wins.

		The hostname holds the OCI registry host (in square brackets if it's
		an IPv6 address).  The repoPrefix holds a prefix to use in front
		of all repositories in the registry.  If there's a "+insecure"
		suffix, it specifies that an insecure HTTP connection should be
		used to this registry; otherwise the default is secure except
		for localhost addresses.

		For example, given:
			CUE_REGISTRY=public-registry.com,github.com/acmecorp=registry.acme.com:6000/modules
		the module named github.com/foo/bar will be fetched
		from public-registry.com; a module named
		github.com/acmecorp/somemodule will be fetched from the
		modules/github.com/acmecorp/somemodule repository in the host
		registry.acme.com at port 6000.

		Requires that CUE_EXPERIMENT=modules is enabled.

	CUE_MODCACHE
		The directory where the cue command will store downloaded
		modules.

		Requires that CUE_EXPERIMENT=modules is enabled.

	CUE_EXPERIMENT
		Comma-separated list of experiments to enable or disable.
		The list of available experiments may change arbitrarily over
		time.  See exp.go in package cuelang.org/go/internal/cueexperiment for
		currently valid values.

		Warning: This variable is provided for the development and
		testing of the cue commands itself. Use beyond that purpose
		is unsupported.

```
