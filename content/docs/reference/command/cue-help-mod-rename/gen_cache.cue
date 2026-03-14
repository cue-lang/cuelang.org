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
									hash:       "OVJCUTM40PMRPTANNUHGG4KK0BTSGND4RQ4A65TD9V43UD0VCEA0===="
									scriptHash: "0GOIPKBAED12RDHN7KPO1SS2QPMGG2SIBP4ADANU3UTC8ROFDM00===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-rc.1.0.20260314205741-820e1530e9ff:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod rename"
										exitCode: 0
										output: """
												Rename changes the name of the current module,
												updating import statements in source files as required.

												Usage:
												  cue mod rename <newModulePath> [flags]

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
