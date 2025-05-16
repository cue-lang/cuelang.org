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
									hash:       "BFV4Q0A680ELGT48CHF84J3Q6Q7Q2FN67OEG23QOJT69JQA4UI0G===="
									scriptHash: "F87HOMPU98EUM0R38QGQ612RVVIQMDJ8EUK88AS25IG4S2AK44EG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.1:$PATH"
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
