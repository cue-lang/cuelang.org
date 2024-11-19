---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help get go"
aliases: ["/docs/reference/cli/cue-get-go/"]
weight: 1000
tags:
- cue command
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgZ2V0IGdv" }
$ cue help get go
go converts Go types into CUE definitions

The command "cue get go" is like "go get", but converts the retrieved Go
packages to CUE. The retrieved packages are put in the CUE module's pkg
directory at the import path of the corresponding Go package. The converted
definitions are available to any CUE file within the CUE module by using
this import path.

The Go type definitions are converted to CUE based on how they would be
interpreted by Go's encoding/json package. Definitions for a Go file foo.go
are written to a CUE file named foo_go_gen.cue.

It is safe for users to add additional files to the generated directories,
as long as their name does not end with _gen.*.


Rules of Converting Go types to CUE

Go structs are converted to cue structs adhering to the following conventions:

	- field names are translated based on the definition of a "json" or "yaml"
	  tag, in that order.

	- embedded structs marked with a json inline tag unify with struct
	  definition. For instance, the Go struct

	    struct MyStruct {
			Common  json:",inline"
			Field string
		 }

	  translates to the CUE struct

		 #MyStruct: Common & {
			 Field: string
		 }

	- a type that implements MarshalJSON, UnmarshalJSON, MarshalYAML, or
	  UnmarshalYAML is translated to top (_) to indicate it may be any
	  value. For some Go core types for which the implementation of these
	  methods is known, like time.Time, the type may be more specific.

	- a type implementing MarshalText or UnmarshalText is represented as
	  the CUE type string

	- slices and arrays convert to CUE lists, except when the element type is
	  byte, in which case it translates to the CUE bytes type.
	  In the case of arrays, the length of the CUE value is constrained
	  accordingly, when possible.

	- Maps translate to a CUE struct, where all elements are constrained to
	  be of Go map element type. Like for JSON, maps may only have string keys.

	- Pointers translate to a sum type with the default value of null and
	  the Go type as an alternative value.

	- Field tags are translated to CUE's field attributes. In some cases,
	  the contents are rewritten to reflect the corresponding types in CUE.
	  The @go attribute is added if the field name or type definition differs
	  between the generated CUE and the original Go.


Native CUE Constraints

Native CUE constraints may be defined in separate cue files alongside the
generated files either in the original Go directory or in the generated
directory. These files can impose additional constraints on types and values
that are not otherwise expressible in Go. The package name for these CUE files
must be the same as that of the Go package.

For instance, for the type

	package foo

	type IP4String string

defined in the Go package, one could add a cue file foo.cue with the following
contents to allow IP4String to assume only valid IP4 addresses:

	package foo

	// IP4String defines a valid IP4 address.
	#IP4String: =~#"^\#(byte)\.\#(byte)\.\#(byte)\.\#(byte)$"#

	// byte defines string allowing integer values of 0-255.
	byte = #"([01]?\d?\d|2[0-4]\d|25[0-5])"#


The "cue get go" command copies any cue files in the original Go package
directory that has a package clause with the same name as the Go package to the
destination directory, replacing its .cue ending with _gen.cue.

Alternatively, the additional native constraints can be added to the generated
package, as long as the file name does not end with _gen.cue.
Running cue get go again to regenerate the package will never overwrite any
files not ending with _gen.*.


Constants and Enums

Go does not have an enum or sum type. Conventionally, a type that is supposed
to be an enum is followed by a const block with the allowed values for that
type. However, as that is only a guideline and not a hard rule, these cases
cannot be translated to CUE disjunctions automatically.

Constant values, however, are generated in a way that makes it easy to convert
a type to a proper enum using native CUE constraints. For instance, the Go type

	package foo

	type Switch int

	const (
		Off Switch = iota
		On
	)

translates into the following CUE definitions:

	package foo

	#Switch: int // #enumSwitch

	#enumSwitch: Off | On

	Off: 0
	On:  1

This definition allows any integer value for #Switch, while the #enumSwitch
value defines all defined constants for Switch and thus all valid values if
#Switch were to be interpreted as an enum type. To turn #Switch into an enum,
include the following constraint in, say, enum.cue, in either the original
source directory or the generated directory:

	package foo

	// limit the valid values for Switch to those existing as constants with
	// the same type.
	#Switch: #enumSwitch

This tells CUE that only the values enumerated by #enumSwitch are valid values
for #Switch. Note that there are now two definitions of #Switch. CUE handles
this in the usual way by unifying the two definitions, in which case the more
restrictive enum interpretation of #Switch remains.

Usage:
  cue get go [packages] [flags]

Flags:
  -e, --exclude string   comma-separated list of regexps of identifiers to omit
      --local            generates files in the main module locally
  -p, --package string   package name for generated CUE files

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
