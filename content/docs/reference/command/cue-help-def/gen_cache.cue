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
									hash:       "LC57UAEM1QOVFSO87LOPN6K1NRBF9L318BS7679NBOGPIRV5E23G===="
									scriptHash: "7GDFD1QL0S42K2OAJULRHJPF9CF7GS9I4NRB393KM6JFTAAELBJ0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.3.0.20261008224848-a4f52c2332e4:$PATH"
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
												  -e, --expression stringArray   evaluate this expression only
												  -f, --force                    overwrite existing regular files
												  -t, --inject stringArray       set the value of a tagged field
												  -T, --inject-vars              inject system variables in tags
												      --inline-imports           expand references to non-core imports
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
