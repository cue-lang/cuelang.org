---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help get go"
weight: 1000
tags:
- cue command
---
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgZ2V0IGdv" }
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

	- each struct follows a single codec: the first one in the priority list
	  given by the --codec flag, "json,yaml" by default, whose tag appears
	  on any of its fields, or else the first codec. Field names are
	  translated based on the tags of that codec.

	- the "jsonv2" codec reads "json" tags like the "json" codec, but follows
	  encoding/json/v2 rather than the v1 API of encoding/json. For example,
	  an "omitempty" option does not make a boolean or number optional, and
	  types which encoding/json/v2 rejects are dropped, such as time.Duration
	  or a struct whose json tags have invalid options.

	- the codec also decides how the fields are encoded: a field is optional
	  if its tag has an "omitempty" or "omitzero" option, a "json" tag with
	  a "string" option encodes a boolean, number, or string as a string,
	  and a pointer field is not nullable under "toml", as TOML has no null.

	- the fields of an embedded struct, or pointer to struct, are promoted
	  like encoding/json does, unless the field's tag gives it a name.
	  Under the "yaml" codec, they are only promoted with an "inline" option,
	  following libraries like gopkg.in/yaml.v3. For instance, the Go struct

	    type MyStruct struct {
			Common
			Field string
		}

	  translates to the CUE struct

		#MyStruct: {
			#Common
			Field: string
		}

	  When some of the promoted fields are hidden by other fields
	  with the same name, the remaining ones are added individually.
	  An "embed" option also promotes the fields of a named field,
	  or holds any other object members in a map or jsontext.Value.

	- a type that implements MarshalJSON, UnmarshalJSON, MarshalJSONTo,
	  UnmarshalJSONFrom, MarshalYAML, or UnmarshalYAML is translated to
	  top (_) to indicate it may be any value. For some Go core types for
	  which the implementation of these methods is known, like time.Time,
	  the type may be more specific. These methods can be omitted with the
	  --omit flag, as described below.

	- a type implementing MarshalText or UnmarshalText is represented as
	  the CUE type string

	- slices and arrays convert to CUE lists, except when the element type is
	  byte, in which case it translates to the CUE bytes type.
	  In the case of arrays, the length of the CUE value is constrained
	  accordingly, when possible.

	- Maps translate to a CUE struct, where all elements are constrained to
	  be of Go map element type. Like for JSON, map keys must be strings,
	  integers, floats, or types implementing MarshalText or UnmarshalText,
	  and are all translated to string labels.

	- Pointers translate to a sum type with the default value of null and
	  the Go type as an alternative value.

	- Field tags are translated to CUE's field attributes. In some cases,
	  the contents are rewritten to reflect the corresponding types in CUE.
	  The @go attribute is added if the field name or type definition differs
	  between the generated CUE and the original Go.


Omitting Declarations and Methods

The --omit flag leaves out the type and constant declarations matched by
any of its selectors written as pkg.Name. The package is given either by
its name, such as "v1", or by its import path, such as
"k8s.io/api/core/v1". Each element is a glob, such as "*" to match any
package, as understood by Go's path.Match. For example:

	--omit='*.Internal*'                 # declarations in any package
	--omit=v1.PodSpec                    # by package name
	--omit=k8s.io/api/core/v1.PodSpec    # by import path

References to omitted types are translated to top, and the fields of an
omitted embedded struct are added individually.

A selector written as pkg.Name.Method instead translates the matched types
as if they lacked the matched methods among those which make a type
translate to top or string, such as MarshalJSON or UnmarshalText.
This is useful when a type only implements them to validate its input,
or to encode it the same way. For example:

	--omit='v1.PodSpec.*'                # all encoding methods
	--omit=v1.PodSpec.UnmarshalJSON      # just one of them
	--omit='*.*.*YAML'                   # YAML methods of all types

Note how --omit=v1.PodSpec omits the type, whereas --omit='v1.PodSpec.*'
keeps the type and omits its encoding methods.
A selector which matches nothing is an error.


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


Alternatives

Go types cannot express enums, sum types, defaults, or most constraints,
so converting them to CUE is lossy. Use this command only when the schemas
you depend on are solely defined as Go types.

When the schemas are also defined in a format such as JSON Schema or OpenAPI,
"cue import" gives much more precise results. Schemas for many well-known
projects, such as Kubernetes or GitHub Actions, are already imported this way
and published as curated modules in the Central Registry. See:

	https://cue.dev/getting-started/schema-library/

When writing or maintaining the schemas yourself, write them in CUE and
generate Go types from them with "cue exp gengotypes".

Usage:
  cue get go [flags] [packages]

Flags:
      --codec string       comma-separated priority list of codecs, such as json, jsonv2, yaml, or toml (default "json,yaml")
      --local              generates files in the main module locally
      --omit stringArray   comma-separated selectors of declarations or methods to omit, such as pkg.Name or pkg.Name.Method
      --outfile string     generate one CUE file for a single Go package
  -p, --package string     package name for generated CUE files
  -v, --verbose            print information about progress

Global Flags:
  -E, --all-errors     print all available errors
  -C, --chdir string   change working directory before running command (must be the first flag)
  -i, --ignore         proceed in the presence of errors
````

