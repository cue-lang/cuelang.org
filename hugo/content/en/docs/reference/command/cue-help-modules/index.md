---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help modules"
aliases: ["/docs/reference/cli/cue-modules/"]
weight: 1000
tags:
- cue command
- modules
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgbW9kdWxlcw==" }
$ cue help modules
Modules are how CUE publishes packages and manages dependencies.

A module is a collection of packages that are released, versioned, and
distributed together. Modules are downloaded from OCI-compliant
artifact registries.

The Central Registry for CUE modules (registry.cue.works) is
used as the source for external modules by default.

For a detailed reference on modules:

	https://cuelang.org/docs/reference/modules/

For information on commands that interact with modules:

    cue help mod

For tutorials on how to use the Central Registry, see:

	https://cuelang.org/docs/tutorial/working-with-the-central-registry/
	https://cuelang.org/docs/tutorial/publishing-modules-to-the-central-registry/

For a tutorial on how to work with a custom OCI registry for CUE modules:

	https://cuelang.org/docs/tutorial/working-with-a-custom-module-registry/

For information on how to specify the CUE registry:

	cue help registryconfig

```
