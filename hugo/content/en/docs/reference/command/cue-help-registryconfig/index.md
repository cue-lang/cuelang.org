---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help registryconfig"
weight: 1000
tags:
- cue command
- modules
---
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgcmVnaXN0cnljb25maWc=" }
$ cue help registryconfig
The registry configuration determines how CUE maps modules to their locations in
OCI registries.

Given a particular registry configuration, it's possible to work what registry a
given module is stored in, and what repository within that registry, without
making any network calls.

If no explicit registry configuration is present, a default Central Registry
(registry.cue.works) is used for all modules.

The simplest way of specifying a registry configuration is to set $CUE_REGISTRY
to the hostname of that registry.

Examples:

	CUE_REGISTRY=myregistry.example
	CUE_REGISTRY=localhost:5000
	CUE_REGISTRY='[::1]:5000'

The special name "none" can be used to indicate that no registry
should be used.

If a path is present too, all modules will be stored under that path.

For example:

	CUE_REGISTRY=localhost:5000/all/modules/will/be/stored/here

By default for hosts other than localhost, a secure (HTTPS) connection will be
used. This default can be set by appending "+insecure" or "+secure".

For example:

	CUE_REGISTRY=100.98.141.117:5000+insecure
	CUE_REGISTRY=localhost:5000/modules+secure

When specified in this way, the registry is used to fetch all modules.

To use a specific registry for only certain subsets of modules, a prefix can be
specified. This constrains a registry to be used only for modules that match
that prefix. If there are multiple registries with a prefix, the longest
matching prefix wins. When matching a prefix, only complete path elements
(non-slash characters) are considered. It's an error if there are two identical
prefixes in the same registry configuration.

For example:

	CUE_REGISTRY='foo.example/bar=localhost:5000,myregistry.example'

In the above example, modules with the prefix "foo.example/bar", such as
"foo.example/bar/somemodule" (but not "foo.example/barry"), will be fetched from
the registry at localhost:5000. All other modules will be fetched from
"myregistry.example".

Note that the syntax above implies that the ordering of the elements in
CUE_REGISTRY isn't important because the resolution algorithm is
order-independent.

To specify that no registry should be used for a given module prefix,
the special name "none" can be used.

For example:

	CUE_REGISTRY='foo.example/bar=none,myregistry.example'

In the above example, any attempt to fetch a module under
"foo.example/bar" will result in a failure. Note that this will not
take effect if the module is already present in the on-disk cache,
which is consulted before looking at CUE_REGISTRY.


Customizing Name Resolution

Some registries have restrictions on what repositories can be used. For example,
a registry implementation might restrict the depth of the available repository
paths, or might even provide access to a single repository only. In order to
accommodate these kinds of limitation, a registry configuration can also be
specified in CUE syntax, usually as a configuration file.

To do this, set CUE_REGISTRY to "file:" followed by the path to the
configuration file. For example:

	CUE_REGISTRY=file:/home/alice/.config/cue/registry.cue

To remove ambiguity, the simpler syntax described earlier can be explicitly
requested with the "simple:" prefix. For example:

	CUE_REGISTRY=simple:myregistry.example

If it is preferable not to create a file on disk for the configuration, the
"inline:" prefix can be used:

	CUE_REGISTRY='inline:defaultRegistry: registry: "myregistry.example"'

The configuration file syntax is described by the following CUE #file schema
definition:

	// #file represents the registry configuration schema.
	#file: {
		// moduleRegistries specifies a mapping from module path prefix
		// (excluding any version suffix) to the registry to be used for
		// all modules under that path.
		//
		// A prefix is considered to match if a non-zero number of
		// initial path elements (sequences of non-slash characters) in
		// a module path match the prefix.
		//
		// If there are multiple matching prefixes, the longest
		// is chosen.
		moduleRegistries?: [#modulePath]: #registry

		// defaultRegistry specifies a fallback registry to be used if no
		// prefix from moduleRegistry matches.
		// If it's not present, a system default will be used.
		defaultRegistry?: #registry
	}

	#registry: {
		// registry specifies the registry host name and optionally, the
		// repository prefix to use for all modules in the repository,
		// and the security to use when accessing the host.
		//
		// It is in the form:
		// 	hostname[:port][/repoPrefix][+insecure]
		//
		// The hostname must be specified in square brackets if it's an
		// IPv6 address.
		//
		// Connections will be secure unless explicitly specified
		// otherwise, except for localhost connections which default to
		// insecure.
		//
		// See the doc comment on pathEncoding for details as to how
		// repoPrefix is used to determine the repository to use for a
		// specific module.
		//
		// As a special case, the registry may be "none", indicating
		// that there is no registry for its associated modules.
		// If a module resolves to a "none" registry, the resolver
		// will return an error.
		//
		// Examples:
		//	"localhost:1234"
		//	"myregistry.example/my-modules+secure"
		//	"none"
		registry!: string

		// pathEncoding specifies how module versions map to
		// repositories within a registry.
		// Possible values are:
		// - "path": the repository is used as a prefix to the unencoded
		// module path. The version of the module is used as a tag.
		// - "hashAsPath": the hex-encoded SHA256 hash of the path is
		// used as a suffix to the above repository value. The version
		// of the module is used as a tag.
		// - "hashAsTag": the repository is used as is: the hex-encoded
		// SHA256 hash of the path followed by a hyphen and the version
		// is used as a tag.
		pathEncoding?: "path" | "hashAsRepo" | "hashAsTag"

		// prefixForTags specifies an arbitrary prefix that's added to
		// all tags. This can be used to disambiguate tags when there
		// might be some possibility of confusion with tags in use for
		// other purposes.
		prefixForTags?: #tag

		// TODO we could encode the invariant below in CUE but that
		// would result in poor error messages. With an error builtin,
		// that could perhaps be improved.

		// stripPrefix specifies that the pattern prefix should be
		// stripped from the module path before using as a repository
		// path. This only applies when pathEncoding is "path".
		stripPrefix?: bool
	}

	// TODO more specific schemas below
	#modulePath: string
	#tag:        string

```
