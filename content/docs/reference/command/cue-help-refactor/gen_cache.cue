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
									hash:       "3RI22R7DGO57PBUAD2SK8U0CSAPHSAAF8IGKTVK59LKRJSTQS200===="
									scriptHash: "JBV248RV81CHEDRBAEO7FGMJ7TD3GJMKUTJSCU748PISCGRQU21G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.3:$PATH"
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
