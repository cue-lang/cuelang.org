package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-fmt": {
						page: {
							cache: {
								multi_step: {
									hash:       "NA51V280BJ2CPUOPKVLVHJ57VA6J0E0GL7G3MS4E6EVG678ATVC0===="
									scriptHash: "A6O0VFV8OV481QSOU9VCPDF2GLL3N6SDCRS85UF38UEN8TAC31FG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-0.dev.0.20250306134408-5d2da079a295:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help fmt"
										exitCode: 0
										output: """
												Fmt formats the given files or the files for the given packages in place

												Arguments are interpreted as import paths (see 'cue help inputs') unless --files is set,
												in which case the arguments are file paths to descend into and format all CUE files.
												Directories named "cue.mod" and those beginning with "." and "_" are skipped unless
												given as explicit arguments.

												Usage:
												  cue fmt [-s] [inputs] [flags]

												Flags:
												      --check   exits with non-zero status if any files are not formatted
												  -d, --diff    display diffs instead of rewriting files
												      --files   treat arguments as file paths to descend into rather than import paths

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
