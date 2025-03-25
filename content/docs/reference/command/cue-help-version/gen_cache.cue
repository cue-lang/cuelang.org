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
									hash:       "4QG4A39QK5C72NI2BS6H9BVL3QMODCTINEL0UQ8LI2G8A2LE7N7G===="
									scriptHash: "CE6LA44AO2RPMDK3UUVMNAPLMCVC4CV9LBMVVL3M8GGUDVN9L52G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.0:$PATH"
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
