---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help refactor imports"
weight: 1000
tags:
- cue command
---
{{<info>}}
This command is still in an experimental stage -- it may be changed or removed at any time.
{{</info>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgcmVmYWN0b3IgaW1wb3J0cw==" }
$ cue help refactor imports
WARNING: THIS COMMAND IS EXPERIMENTAL.

This command alters import directives in the current module. By
default it rewrites any imports in the current module that have a path
prefix matching oldImportPath to replace that prefix by newImportPath.
It does not attempt to adjust the contents of the cue.mod/module.cue file:
use "cue mod get" or "cue mod tidy" for that.

If oldImportPath is underneath one of the dependency modules,
only imports in that module will be altered, unless --all-major
is specified, in which case all modules with that as a prefix will be
refactored.

Note: if oldImportPath specifies a major version, then it
*must* be underneath a dependency module.

If the --exact flag is specified, then oldImportPath is only
considered to match when the entire path matches, rather than matching
any path prefix. The --exact flag is implied if either oldImportPath
or newImportPath contain an explicit package qualifier or when the
--ident flag is specified.

With only one argument, the command will first resolve the current
default major version for the argument (ignoring any major version)
and then take oldImportPath to be path of the argument with that major
version. This means that the single argument form can be used to
upgrade the major version of a module, assuming the packages in that
module remain stable.

If oldImportPath is omitted and --exact *is* specified, oldImportPath
is taken to be the same as newImportPath. This is useful in
conjunction with --ident.

By default the identifier that the package is imported as will be kept
the same (this is to minimize code churn). However, if --update-ident
is specified, the identifier that the package is imported as will be
updated according to the new import path's default identifier. If
--ident is specified, the identifier that the package is imported as
will be updated to that identifier; this also implies --exact. The
resulting CUE code is sanitized: that is, other than importing a
different package, identifiers within the file will always refer to
the same import directive.

For example:

	# Change from k8s "cue get go" imports to new curated namespace
	cue refactor imports k8s.io cuelabs.dev/x/k8s

	# Update to use a new major version of the foo.com/bar module.
	cue refactor imports foo.com/bar@v0 foo.com/bar@v1

	# A shorter form of the above, assuming v0 is the default major
	# version for foo.com/bar.
	cue refactor imports foo.com/bar@v1

	# Use a different package from the pubsub package directory
	cue refactor imports github.com/cue-unity/services/pubsub github.com/cue-unity/services/pubsub:otherpkg

	# Use a different identifier for the import of the pubsub package.
	cue refactor imports --ident otherPubSub github.com/cue-unity/services/pubsub

	# Update only foo.com/bar, not (say) foo.com/baz/somethingelse
	cue refactor imports --exact foo.com/bar foo.com/baz

Usage:
  cue refactor imports [<oldImportPath] <newImportPath> [flags]

Flags:
      --all-major      match all versions when major version omitted
      --exact          exact match for package path instead of prefix match
      --ident string   specify imported identifier (implies --exact)
      --update-ident   update imported identifier name too

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
````
