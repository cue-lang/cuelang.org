package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-get-go": {
						page: {
							cache: {
								multi_step: {
									hash:       "1VIMD88HBT5TS68RRQQM2PQSRI29K5LR9OMSA8VO2RB0A60S170G===="
									scriptHash: "2M6KHK4CP5OVF9OFRB0CJAHLLFTIQ68QL6FEGLTVOB62MQ25SSOG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20261002131943-93402de82790:$PATH"
										exitCode: 0
										output:   ""
									}, {
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

												\t- each struct follows a single codec: the first one in the priority list
												\t  given by the --codec flag, "json,yaml" by default, whose tag appears
												\t  on any of its fields, or else the first codec. Field names are
												\t  translated based on the tags of that codec.

												\t- the "jsonv2" codec reads "json" tags like the "json" codec, but follows
												\t  encoding/json/v2 rather than the v1 API of encoding/json. For example,
												\t  an "omitempty" option does not make a boolean or number optional, and
												\t  types which encoding/json/v2 rejects are dropped, such as time.Duration
												\t  or a struct whose json tags have invalid options.

												\t- the codec also decides how the fields are encoded: a field is optional
												\t  if its tag has an "omitempty" or "omitzero" option, a "json" tag with
												\t  a "string" option encodes a boolean, number, or string as a string,
												\t  and a pointer field is not nullable under "toml", as TOML has no null.

												\t- the fields of an embedded struct, or pointer to struct, are promoted
												\t  like encoding/json does, unless the field's tag gives it a name.
												\t  Under the "yaml" codec, they are only promoted with an "inline" option,
												\t  following libraries like gopkg.in/yaml.v3. For instance, the Go struct

												\t    type MyStruct struct {
												\t\t\tCommon
												\t\t\tField string
												\t\t}

												\t  translates to the CUE struct

												\t\t#MyStruct: {
												\t\t\t#Common
												\t\t\tField: string
												\t\t}

												\t  When some of the promoted fields are hidden by other fields
												\t  with the same name, the remaining ones are added individually.
												\t  An "embed" option also promotes the fields of a named field,
												\t  or holds any other object members in a map or jsontext.Value.

												\t- a type that implements MarshalJSON, UnmarshalJSON, MarshalJSONTo,
												\t  UnmarshalJSONFrom, MarshalYAML, or UnmarshalYAML is translated to
												\t  top (_) to indicate it may be any value. For some Go core types for
												\t  which the implementation of these methods is known, like time.Time,
												\t  the type may be more specific. These methods can be omitted with the
												\t  --omit flag, as described below.

												\t- a type implementing MarshalText or UnmarshalText is represented as
												\t  the CUE type string

												\t- slices and arrays convert to CUE lists, except when the element type is
												\t  byte, in which case it translates to the CUE bytes type.
												\t  In the case of arrays, the length of the CUE value is constrained
												\t  accordingly, when possible.

												\t- Maps translate to a CUE struct, where all elements are constrained to
												\t  be of Go map element type. Like for JSON, map keys must be strings,
												\t  integers, floats, or types implementing MarshalText or UnmarshalText,
												\t  and are all translated to string labels.

												\t- Pointers translate to a sum type with the default value of null and
												\t  the Go type as an alternative value.

												\t- Field tags are translated to CUE's field attributes. In some cases,
												\t  the contents are rewritten to reflect the corresponding types in CUE.
												\t  The @go attribute is added if the field name or type definition differs
												\t  between the generated CUE and the original Go.


												Omitting Declarations and Methods

												The --omit flag leaves out the type and constant declarations matched by
												any of its selectors written as pkg.Name. The package is given either by
												its name, such as "v1", or by its import path, such as
												"k8s.io/api/core/v1". Each element is a glob, such as "*" to match any
												package, as understood by Go's path.Match. For example:

												\t--omit='*.Internal*'                 # declarations in any package
												\t--omit=v1.PodSpec                    # by package name
												\t--omit=k8s.io/api/core/v1.PodSpec    # by import path

												References to omitted types are translated to top, and the fields of an
												omitted embedded struct are added individually.

												A selector written as pkg.Name.Method instead translates the matched types
												as if they lacked the matched methods among those which make a type
												translate to top or string, such as MarshalJSON or UnmarshalText.
												This is useful when a type only implements them to validate its input,
												or to encode it the same way. For example:

												\t--omit='v1.PodSpec.*'                # all encoding methods
												\t--omit=v1.PodSpec.UnmarshalJSON      # just one of them
												\t--omit='*.*.*YAML'                   # YAML methods of all types

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


												Alternatives

												Go types cannot express enums, sum types, defaults, or most constraints,
												so converting them to CUE is lossy. Use this command only when the schemas
												you depend on are solely defined as Go types.

												When the schemas are also defined in a format such as JSON Schema or OpenAPI,
												"cue import" gives much more precise results. Schemas for many well-known
												projects, such as Kubernetes or GitHub Actions, are already imported this way
												and published as curated modules in the Central Registry. See:

												\thttps://cue.dev/getting-started/schema-library/

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
