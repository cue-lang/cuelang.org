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
									hash:       "KSKO8ODUMPBQ5PAS6BTQ9F6V49VK6Q55K1J2IOHDR2R02B6JE4RG===="
									scriptHash: "MUI3GR6MQDBF208C7R933MDTN909V4CQOP15BN9AGL6CA6NSHURG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-alpha.2.0.20260220153551-3dfa50a46189:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help version"
										exitCode: 0
										output: """
												print the CUE version and build information

												Usage:
												  cue version [flags]

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output

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
