package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-exp-gengotypes": {
						page: {
							cache: {
								multi_step: {
									hash:       "M7J6Q0RC5IA1BGBUQJJCEI8O8NCOA5REAQVLRM56OBJ184RPAUNG===="
									scriptHash: "KQ0V60V4JUS1VRU3E7U2VAS3PETPFB2NL3EUA4T6UABPO90C60A0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-0.dev.0.20260702073200-7686325819d2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help exp gengotypes"
										exitCode: 0
										output: """
												WARNING: THIS COMMAND IS EXPERIMENTAL.

												gengotypes generates Go type definitions from exported CUE definitions.

												The generated Go types are guaranteed to accept any value accepted by the CUE definitions,
												but may be more general. For example, "string | int" will translate into the Go
												type "any" because the Go type system is not able to express disjunctions.

												To ensure that the resulting Go code works, any imported CUE packages or
												referenced CUE definitions are transitively generated as well.
												Code is generated in each CUE package directory at cue_types_${pkgname}_gen.go,
												where the package name is omitted from the filename if it is implied by the import path.
												The --outfile flag can be used to write the output for a single CUE package to a specific file,
												or to stdout when set to "-".

												Generated Go type and field names may differ from the original CUE names by default.
												For instance, an exported definition "#foo" becomes "Foo",
												and a nested definition like "#foo.#bar" becomes "Foo_Bar".

												@go attributes can be used to override which name to be generated:

												\tpackage foo
												\t@go(betterpkgname)

												\t#Bar: {
												\t\t@go(BetterBarTypeName)
												\t\trenamed: int @go(BetterFieldName)
												\t}

												The attribute "@go(-)" can be used to ignore a definition or field:

												\t#ignoredDefinition: {
												\t\t@go(-)
												\t}
												\tignoredField: int @go(-)

												"type=" overrides an entire value to generate as a given Go type expression:

												\tretypedLocal:  [string]: int @go(,type=map[LocalType]int)
												\tretypedImport: [...string]   @go(,type=[]"foo.com/bar".ImportedType)

												"optional=" controls how CUE optional fields are generated as Go fields.
												The default is "zero", representing a missing field as the zero value.
												"nillable" ensures the generated Go type can represent missing fields as nil.

												\toptionalDefault?:  int                         // generates as "int64"
												\toptionalNillable?: int @go(,optional=nillable) // generates as "*int64"
												\tnested: {
												\t\t@go(,optional=nillable) // set for all fields under this struct
												\t}

												Usage:
												  cue exp gengotypes [flags]

												Flags:
												  -o, --outfile string   generate one Go file for a single CUE package

												Global Flags:
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors
												  -s, --simplify       simplify output

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
