package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-eval": {
						page: {
							cache: {
								multi_step: {
									hash:       "5J55J7F2MGM32IKRUVV015ELRS8Q4Q0G6FR6DAMM845RNOVOPGJ0===="
									scriptHash: "72TLPP05QANPQB08T6A2Q010898EL929I7LHJNTAML4V9SEUAMFG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-alpha.1.0.20250913190050-8572198e1792:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help eval"
										exitCode: 0
										output: """
												eval evaluates, validates, and prints a configuration.

												Printing is skipped if validation fails.

												The --expression flag is used to evaluate an expression within the
												configuration file, instead of the entire configuration file itself.

												Examples:

												  $ cat <<EOF > foo.cue
												  a: ["a", "b", "c"]
												  EOF

												  $ cue eval foo.cue -e a[0] -e a[2]
												  "a"
												  "c"

												Usage:
												  cue eval [flags]

												Flags:
												  -a, --all                      show optional and hidden fields
												  -c, --concrete                 require the evaluation to be concrete
												  -e, --expression stringArray   evaluate this expression only
												  -f, --force                    force overwriting existing files
												  -t, --inject stringArray       set the value of a tagged field
												  -T, --inject-vars              inject system variables in tags
												      --list                     concatenate multiple objects into a list
												      --merge                    merge non-CUE files (default true)
												  -n, --name string              regexp filter for non-CUE file names in directories
												      --out string               output format (run 'cue help filetypes' for more info)
												  -o, --outfile string           filename or - for stdout with optional file prefix (run 'cue help filetypes' for more info)
												  -p, --package string           package name for non-CUE files
												  -l, --path stringArray         CUE expression for single path component (see 'cue help flags' for details)
												      --proto_enum string        mode for rendering enums (int|json) (default "int")
												  -I, --proto_path stringArray   paths in which to search for imports
												  -d, --schema string            expression to select schema for evaluating values in non-CUE files
												  -A, --show-attributes          display field attributes
												  -H, --show-hidden              display hidden fields
												  -O, --show-optional            display optional fields
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
