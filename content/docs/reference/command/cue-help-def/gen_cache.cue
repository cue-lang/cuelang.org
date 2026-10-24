package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-def": {
						page: {
							cache: {
								multi_step: {
									hash:       "7FCKKAJLMH6K6J7T0451G7QR7Q40DAGP4H3911M8GOENGM7ADPBG===="
									scriptHash: "NKCDR5DMBLDO7NTEBTJ9DJ0OQTL5G9M3OGUCR1TC53E3G7MC7LS0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.1.0.20261023142911-c9393fa32ac5:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help def"
										exitCode: 0
										output: """
												def prints consolidated configuration as a single file.

												Printing is skipped if validation fails.

												Input arguments can be CUE packages, CUE files, non-CUE files, or some
												combinations of those. See "cue help inputs" for more detail.

												The --expression flag is used to only print parts of a configuration.

												Usage:
												  cue def [flags] [inputs]

												Flags:
												  -e, --expression stringArray         evaluate this expression only
												  -f, --force[=true|false]             overwrite existing regular files
												  -t, --inject stringArray             set the value of a tagged field
												  -T, --inject-vars[=true|false]       inject system variables in tags
												      --inline-imports[=true|false]    expand references to non-core imports
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
