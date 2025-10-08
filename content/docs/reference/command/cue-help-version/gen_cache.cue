package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-version": {
						page: {
							cache: {
								multi_step: {
									hash:       "HMTCRGNH1Q1823A90I4REBL8D3RFG5H1SPDU0I91R9BA3LSU1S3G===="
									scriptHash: "UN91L8AUAT1PP0NTRUSRO6DV3BEI05C940L68AC8212VN6MTASOG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help version"
										exitCode: 0
										output: """
												print CUE version

												Usage:
												  cue version [flags]

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
