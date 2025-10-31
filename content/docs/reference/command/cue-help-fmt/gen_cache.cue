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
									hash:       "6V3O9VUM1OKBG8N2EJ9HB7SDM82VQ24KB48EF13COJSUNMVVPQ60===="
									scriptHash: "ROQC9T6K255EMPSM1501RGCUQ0G2DE2QG8U3EAFNACFB6IEU1CU0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-rc.1.0.20251031142455-4ba957271db1:$PATH"
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
