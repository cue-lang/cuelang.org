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
									hash:       "BT540RBFU7MNPCPKIALCD4DRQSDDRR8M41D1RB2E5TSL8U3HL5LG===="
									scriptHash: "KG8O8R8RIHK8A1AAJ97619U3L59SC3L2RCOSO5OKLIQJFUCD9K6G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-alpha.1.0.20260213130521-9e2dec3b9a23:$PATH"
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
