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
									hash:       "NBMNGRH3D7I8F3OHNUQ270JOFSVNN39F8KAVHMQ1CRPDRH5A2Q9G===="
									scriptHash: "VL4TKDNU0NLF243KAO49KNTFTVF8934G20VA2DBFFSME3FT8T6K0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.3:$PATH"
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
												  -a, --all[=true|false]               show optional and hidden fields
												  -c, --concrete[=true|false]          require the evaluation to be concrete
												  -e, --expression stringArray         evaluate this expression only
												  -f, --force[=true|false]             overwrite existing regular files
												  -t, --inject stringArray             set the value of a tagged field
												  -T, --inject-vars[=true|false]       inject system variables in tags
												      --language-version string        fallback language version for input outside a module (for example, v0.17.0)
												      --list[=true|false]              concatenate multiple objects into a list
												      --merge[=true|false]             merge non-CUE files (default true)
												      --out string                     output format (run 'cue help filetypes' for more info)
												  -o, --outfile string                 filename or - for stdout with optional file prefix (run 'cue help filetypes' for more info)
												  -p, --package string                 package name for non-CUE files and CUE output
												  -l, --path stringArray               CUE expression for single path component (see 'cue help flags' for details)
												      --proto_enum string              mode for rendering enums (int|json) (default "int")
												  -I, --proto_path stringArray         paths in which to search for imports
												  -d, --schema stringArray             expression to select schema for evaluating values in non-CUE files
												  -A, --show-attributes[=true|false]   display field attributes
												  -H, --show-hidden[=true|false]       display hidden fields
												  -O, --show-optional[=true|false]     display optional fields
												  -s, --simplify[=true|false]          simplify output
												      --with-context[=true|false]      import as object with contextual data (see 'cue help flags' for details)

												Global Flags:
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

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
