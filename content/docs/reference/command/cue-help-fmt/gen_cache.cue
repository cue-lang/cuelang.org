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
									hash:       "86TGQICU15MHFQJ2K2SPV3PQG2Q4F82HPGG98APGGQL88JTCLOIG===="
									scriptHash: "620TMK2FL07U7R5A5AO41A7NAB6HITNTPQ0PAQOG61L4VOR4S7U0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.1:$PATH"
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
