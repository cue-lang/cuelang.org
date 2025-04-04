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
									hash:       "ES4TURV3TNCEU2NHVQ936C4C9PIG663G7262E6URBU44LEPOGEI0===="
									scriptHash: "E8D8Q06FU7NN2KUCM0SJFKT8B28HBAHDM1SI9L1HG1KP7R0B0BU0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help exp gengotypes"
										exitCode: 0
										output: """
												gengotypes generates Go type definitions from exported CUE definitions.

												The generated Go types are guaranteed to accept any value accepted by the CUE definitions,
												but may be more general. For example, "string | int" will translate into the Go
												type "any" because the Go type system is not able to express
												disjunctions.

												To ensure that the resulting Go code works, any imported CUE packages or
												referenced CUE definitions are transitively generated as well.
												The generated code is placed in cue_gen.go files in the directory of each CUE package.

												Generated Go type and field names may differ from the original CUE names by default.
												For instance, an exported definition "#foo" becomes "Foo",
												given that Go uses capitalization to export names in a package,
												and a nested definition like "#foo.#bar" becomes "Foo_Bar",
												given that Go does not allow declaring nested types.

												@go attributes can be used to override which name or type to be generated, for example:

												\tpackage foo
												\t@go(betterpkgname)

												\trenamed: int @go(BetterName)
												\tretyped: string @go(,type=foo.com/bar.NamedString)

												The attribute "@go(-)" can be used to ignore a definition or field, for example:

												\t#ignoredDefinition: {
												\t\t@go(-)
												\t}
												\tignoredField: int @go(-)

												Usage:
												  cue exp gengotypes [flags]

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
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
