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
									hash:       "B3NFS1KULUVVKFTRG2H2DF8NC3FAE35GUN6OTMKLQ3NP3TGSVK0G===="
									scriptHash: "2RKH63KUSCLL1EKJDO4M5CDS4DTJ2OM7EQ00RK13MQ89JCVSCV20===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-alpha.1.0.20260213130521-9e2dec3b9a23:$PATH"
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
