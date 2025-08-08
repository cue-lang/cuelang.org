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
									hash:       "9QRCDM8CK7VDU5THQVHQI367KDJ1RP7J05CG1MQ8Q9BQI177AROG===="
									scriptHash: "CUK361CVMF5DC527EA5O58BOTJK8KMF24H83JROIAU8KJ2E5UA8G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-0.dev.0.20250808151001-88adc227ad53:$PATH"
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
