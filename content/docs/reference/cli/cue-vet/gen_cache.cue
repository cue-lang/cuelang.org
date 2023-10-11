package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-vet": {
						page: {
							cache: {
								multi_step: {
									"IKPSB63GG0O8OKAC26T086V23PO86CLR2L7KKMQ66RLACECS69B0====": [{
										cmd:      "cue help vet"
										exitCode: 0
										output: """
												vet validates CUE and other data files

												By default it will only validate if there are no errors.
												The -c validates that all regular fields are concrete.


												Checking non-CUE files

												Vet can also check non-CUE files. The following file formats are
												currently supported:

												  Format       Extensions
												\tJSON       .json .jsonl .ndjson
												\tYAML       .yaml .yml
												\tTEXT       .txt  (validate a single string value)

												To activate this mode, the non-cue files must be explicitly mentioned on the
												command line. There must also be at least one CUE file to hold the constraints.

												In this mode, each file will be verified against a CUE constraint. If the files
												contain multiple objects (such as using --- in YAML), they will all be verified
												individually.

												By default, each file is checked against the root of the loaded CUE files.
												The -d can be used to only verify files against the result of an expression
												evaluated within the CUE files. This can be useful if the CUE files contain
												a set of definitions to pick from.

												Examples:

												  # Check files against a CUE file:
												  cue vet foo.yaml foo.cue

												  # Check files against a particular expression
												  cue vet translations/*.yaml foo.cue -d '#Translation'

												If more than one expression is given, all must match all values.

												Usage:
												  cue vet [flags]

												Flags:
												  -c, --concrete                 require the evaluation to be concrete
												  -t, --inject stringArray       set the value of a tagged field
												  -T, --inject-vars              inject system variables in tags
												      --list                     concatenate multiple objects into a list
												      --merge                    merge non-CUE files (default true)
												  -n, --name string              glob filter for non-CUE file names in directories
												  -p, --package string           package name for non-CUE files
												  -l, --path stringArray         CUE expression for single path component (see 'cue help flags' for details)
												      --proto_enum string        mode for rendering enums (int|json) (default "int")
												  -I, --proto_path stringArray   paths in which to search for imports
												  -d, --schema string            expression to select schema for evaluating values in non-CUE files
												      --with-context             import as object with contextual data

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
