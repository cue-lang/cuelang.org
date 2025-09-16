package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-vet": {
						page: {
							cache: {
								multi_step: {
									hash:       "DSIT0R0RTTBT37844K629B7F2IVRGV210LDV009ICKI2FNMFPA40===="
									scriptHash: "CSDIKTNPDOM9GOHEN29R76J8K77O4T3S0AA84RA582A7TJEOP020===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help vet"
										exitCode: 0
										output: """
												The vet command validates CUE and other data files.

												The command is silent when it succeeds, emitting no output and an exit code of
												zero. Otherwise, errors are reported and the command returns a non-zero exit
												code.

												vet starts by ensuring that there are no validation errors. If errors are found
												then they are reported and the command exits.

												If there are no validation errors then, by default, vet checks that the result
												of the evaluation is concrete. It reports an error if the evaluation contains
												any regular fields that have non-concrete values.
												Skip this step by specifying -c=false, which permits regular fields to have
												non-concrete values. Specify -c/-c=true to report errors mentioning which
												regular fields have non-concrete values.


												Checking non-CUE files

												Vet can also check non-CUE files. The following file formats are
												currently supported:

												  Format       Extensions
												\tJSON       .json .jsonl .ndjson
												\tYAML       .yaml .yml
												\tTOML       .toml
												\tTEXT       .txt  (validate a single string value)

												To activate this mode, the non-CUE files must be explicitly mentioned on the
												command line. There must also be at least one CUE file to hold the constraints.

												In this mode, each file will be verified against a CUE constraint. If the files
												contain multiple objects (such as using --- in YAML) then each object will be
												verified individually.

												By default, each file is checked against the root of the loaded CUE files.
												The -d can be used to only verify files against the result of an expression
												evaluated within the CUE files. This can be useful if the CUE files contain
												a set of definitions to pick from.

												Examples:

												  # Check files against a CUE file:
												  cue vet -c foo.cue foo.yaml

												  # Check files against a particular expression
												  cue vet -c foo.cue lang/en.yaml lang/de.yaml -d '#Translation'

												More than one expression may be given using multiple -d flags. Each non-CUE
												file must match all expression values.

												Usage:
												  cue vet [flags]

												Flags:
												  -c, --concrete                 require the evaluation to be concrete, or set -c=false to allow incomplete values
												  -t, --inject stringArray       set the value of a tagged field
												  -T, --inject-vars              inject system variables in tags
												      --list                     concatenate multiple objects into a list
												      --merge                    merge non-CUE files (default true)
												  -n, --name string              regexp filter for non-CUE file names in directories
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
