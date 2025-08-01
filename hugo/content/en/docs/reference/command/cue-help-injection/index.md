---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help injection"
weight: 1000
tags:
- cue command
---
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgaW5qZWN0aW9u" }
$ cue help injection
Many of the cue commands allow injecting values or
selecting files from the command line using the --inject/-t flag.


Injecting files

A "build" attribute defines a boolean expression that causes a file
to only be included in a build if its expression evaluates to true.
There may only be a single @if attribute per file and it must
appear before a package clause, or before any CUE declarations
if there is no package clause.

The expression is a subset of CUE consisting only of identifiers
and the operators &&, ||, !, where identifiers refer to tags
defined by the user on the command line.

For example, the following file will only be included in a build
if the user includes the flag "-t prod" on the command line.

	// File prod.cue
	@if(prod)

	package foo

Ignoring files

An "ignore" attribute causes a file to be unconditionally excluded
from a build. The @ignore attribute must appear before a package
clause or before any other CUE syntax if there is no package clause.

For example:

	@ignore()

	// This file will be excluded for all purposes.

	package foo

Injecting values

The injection mechanism allows values to be injected into fields
that are not defined within the scope of a comprehension, list, or
optional field and that are marked with a "tag" attribute. For any
field of the form

	field: x @tag(key)

an "--inject key=value" flag will modify the field to

	field: x & "value"

By default, the injected value is treated as a string.
Alternatively, the "type" option allows a value to be interpreted
as an int, number, or bool. For instance, for a field

	field: x @tag(key,type=int)

the flag "-t key=2" modifies the field to

	field: x & 2

Valid values for type are "int", "number", "bool", and "string".

A tag attribute can also define shorthand values, which can be
injected into the fields without having to specify the key. For
instance, for

	environment: string @tag(env,short=prod|staging)

"-t prod" sets the environment field to the value "prod". It is
still possible to specify "-t env=prod" in this case.

Use the usual CUE constraints to limit the possible values of a
field. For instance

	environment: "prod" | "staging" @tag(env,short=prod|staging)

ensures the user may only specify "prod" or "staging".


Tag variables

The injection mechanism allows for the injection of system variables:
when variable injection is enabled by passing the --inject-vars/-T flag,
tags of the form

	@tag(dir,var=cwd)

will inject the named variable (here cwd) into the tag. An explicitly
set value for a tag using --inject/-t takes precedence over an
available tag variable.

The following variables are supported:

   now        current time in RFC3339 format.
   os         OS identifier of the current system. Valid values:
                aix       android   darwin    dragonfly
                freebsd   illumos   ios       js (wasm)
                linux     netbsd    openbsd   plan9
                solaris   windows
   arch       architecture identifier of the current system. Valid values:
                386        amd64        amd64p32  arm
                armbe      arm64        arm64be   loong64
                mips       mipsle       mips64    mips64le
                mips64p32  mips64p32le  ppc       ppc64
                ppc64le    riscv        riscv64   s390
                s390x      sparc        sparc64   wasm
   cwd        working directory
   username   current username
   hostname   current hostname
   rand       a random 128-bit integer

```
