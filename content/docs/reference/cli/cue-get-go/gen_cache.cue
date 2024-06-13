package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-get-go": {
						page: {
							cache: {
								multi_step: {
									hash:       "I6O8SDT4P3MCNAP5P0IHD3JNJ5JS8LJSL3NRK3KKTLFMENAJ9FJG===="
									scriptHash: "TN8JV7CM36J62GJO92NQMUAG0A5KL3EO6C85U6E65V3OTE17G9NG===="
									steps: [{
										doc:      ""
										cmd:      "cue help get go"
										exitCode: 0
										output: """
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

												\t- field names are translated based on the definition of a "json" or "yaml"
												\t  tag, in that order.

												\t- embedded structs marked with a json inline tag unify with struct
												\t  definition. For instance, the Go struct

												\t    struct MyStruct {
												\t\t\tCommon  json:",inline"
												\t\t\tField string
												\t\t }

												\t  translates to the CUE struct

												\t\t #MyStruct: Common & {
												\t\t\t Field: string
												\t\t }

												\t- a type that implements MarshalJSON, UnmarshalJSON, MarshalYAML, or
												\t  UnmarshalYAML is translated to top (_) to indicate it may be any
												\t  value. For some Go core types for which the implementation of these
												\t  methods is known, like time.Time, the type may be more specific.

												\t- a type implementing MarshalText or UnmarshalText is represented as
												\t  the CUE type string

												\t- slices and arrays convert to CUE lists, except when the element type is
												\t  byte, in which case it translates to the CUE bytes type.
												\t  In the case of arrays, the length of the CUE value is constrained
												\t  accordingly, when possible.

												\t- Maps translate to a CUE struct, where all elements are constrained to
												\t  be of Go map element type. Like for JSON, maps may only have string keys.

												\t- Pointers translate to a sum type with the default value of null and
												\t  the Go type as an alternative value.

												\t- Field tags are translated to CUE's field attributes. In some cases,
												\t  the contents are rewritten to reflect the corresponding types in CUE.
												\t  The @go attribute is added if the field name or type definition differs
												\t  between the generated CUE and the original Go.


												Native CUE Constraints

												Native CUE constraints may be defined in separate cue files alongside the
												generated files either in the original Go directory or in the generated
												directory. These files can impose additional constraints on types and values
												that are not otherwise expressible in Go. The package name for these CUE files
												must be the same as that of the Go package.

												For instance, for the type

												\tpackage foo

												\ttype IP4String string

												defined in the Go package, one could add a cue file foo.cue with the following
												contents to allow IP4String to assume only valid IP4 addresses:

												\tpackage foo

												\t// IP4String defines a valid IP4 address.
												\t#IP4String: =~#"^\\#(byte)\\.\\#(byte)\\.\\#(byte)\\.\\#(byte)$"#

												\t// byte defines string allowing integer values of 0-255.
												\tbyte = #"([01]?\\d?\\d|2[0-4]\\d|25[0-5])"#


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

												\tpackage foo

												\ttype Switch int

												\tconst (
												\t\tOff Switch = iota
												\t\tOn
												\t)

												translates into the following CUE definitions:

												\tpackage foo

												\t#Switch: int // #enumSwitch

												\t#enumSwitch: Off | On

												\tOff: 0
												\tOn:  1

												This definition allows any integer value for #Switch, while the #enumSwitch
												value defines all defined constants for Switch and thus all valid values if
												#Switch were to be interpreted as an enum type. To turn #Switch into an enum,
												include the following constraint in, say, enum.cue, in either the original
												source directory or the generated directory:

												\tpackage foo

												\t// limit the valid values for Switch to those existing as constants with
												\t// the same type.
												\t#Switch: #enumSwitch

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
												      --strict       report errors for lossy mappings
												      --trace        trace computation
												  -v, --verbose      print information about progress

												"""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
