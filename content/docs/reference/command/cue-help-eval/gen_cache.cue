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
									hash:       "3JP4C4RIH0S0GGO62A163KTE8I02BA5A50HKU5UOGL0D7EU8IIT0===="
									scriptHash: "IF3PTI3PD69VKSK9JRU7O1EIK25LAJQ0JJLD6BGLJHTT9FGGDJG0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20261002131943-93402de82790:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help eval"
										exitCode: 0
										output: """
												eval evaluates, validates, and prints a configuration.

												Printing is skipped if validation fails.

												Input arguments can be CUE packages, CUE files, non-CUE files, or some
												combinations of those. See "cue help inputs" for more detail.

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
												  cue eval [flags] [inputs]

												Flags:
												  -a, --all                      show optional and hidden fields
												  -c, --concrete                 require the evaluation to be concrete
												  -e, --expression stringArray   evaluate this expression only
												  -f, --force                    overwrite existing regular files
												  -t, --inject stringArray       set the value of a tagged field
												  -T, --inject-vars              inject system variables in tags
												      --list                     concatenate multiple objects into a list
												      --merge                    merge non-CUE files (default true)
												      --out string               output format (run 'cue help filetypes' for more info)
												  -o, --outfile string           filename or - for stdout with optional file prefix (run 'cue help filetypes' for more info)
												  -p, --package string           package name for non-CUE files and CUE output
												  -l, --path stringArray         CUE expression for single path component (see 'cue help flags' for details)
												      --proto_enum string        mode for rendering enums (int|json) (default "int")
												  -I, --proto_path stringArray   paths in which to search for imports
												  -d, --schema stringArray       expression to select schema for evaluating values in non-CUE files
												  -A, --show-attributes          display field attributes
												  -H, --show-hidden              display hidden fields
												  -O, --show-optional            display optional fields
												  -s, --simplify                 simplify output
												      --with-context             import as object with contextual data (see 'cue help flags' for details)

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
