package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-rename": {
						page: {
							cache: {
								multi_step: {
									hash:       "EUUACRRJ2R93I2E6HRJFNSTV2DEJPL2U1CL1PIIPBLSG9T072PPG===="
									scriptHash: "VEP4SBHARN84UE8C973D7AG2836HCES1SS13VO5QLH7J8UFEJGM0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod rename"
										exitCode: 0
										output: """
												Rename changes the name of the current module,
												updating import statements in source files as required.

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod rename <newModulePath> [flags]

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
