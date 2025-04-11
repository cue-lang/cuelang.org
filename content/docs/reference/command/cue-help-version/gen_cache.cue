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
									hash:       "6VLTNU7B30K87O229536K0L2JSMCP6S5KTV2ABQDT4SID2NJVA9G===="
									scriptHash: "8KMMHCHB632B8TLRVELPIEJKLHS63DNIU2EVVP5L6H32GQVRTOEG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-alpha.3.0.20250411164907-08c3542c9d96:$PATH"
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
