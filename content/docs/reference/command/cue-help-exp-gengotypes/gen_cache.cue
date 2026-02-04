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
									hash:       "M8BU9CO8VMB8B5SR00BG9B51O2D6K7OND70DM78QGF601VIO5IK0===="
									scriptHash: "T545REDDL37I478L37CHVFCAT8EM49D5JC4Q29SJ35V47DAPJD20===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-alpha.1.0.20260204102828-049d6e12211e:$PATH"
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

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output

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
