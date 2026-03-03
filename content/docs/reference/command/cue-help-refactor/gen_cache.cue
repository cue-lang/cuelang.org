package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-refactor": {
						page: {
							cache: {
								multi_step: {
									hash:       "T3KLRN4SNUVEMP5J3U3VU9PB192VDMJP8310JKTGFQH2M10HVVJG===="
									scriptHash: "QI0L743BCM1VF257R249DUJHV90S53O1U1NIQ45GJ76CRGJEVL10===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help refactor"
										exitCode: 0
										output: """
												This command groups together commands relating
												to altering code within the current CUE module.

												Usage:
												  cue refactor <cmd> [arguments] [flags]

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
