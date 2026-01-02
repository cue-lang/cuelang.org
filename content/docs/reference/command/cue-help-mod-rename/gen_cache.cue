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
									hash:       "TP57V3B4E0LTUJVQEHTANF3MPG4BKHRSLP19PT3CSCTSCCVAT8KG===="
									scriptHash: "R38KQB047BPB0SMSKIHUDB4BIOTNTSP435N0JL6RF6LOK3QMPBVG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.3:$PATH"
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
