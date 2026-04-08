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
									hash:       "8B0LPRNIRH065CQR5IOUUK1J4T8QKH9BN5APO11HGIAP72VNPLUG===="
									scriptHash: "26N2VPSE396J2DRDCGOL70VS8G406439PF08MPPOPQQ5PG3SRSLG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.1:$PATH"
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
