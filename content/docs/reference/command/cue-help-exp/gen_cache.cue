package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-exp": {
						page: {
							cache: {
								multi_step: {
									hash:       "DRDT4MFV4D0PDHKKI5RK7U3SISBD3V3EQ573F8IRU4JN6JPUUBR0===="
									scriptHash: "6PNK1TGU8J8QANH5F8AHAHT7RVL1PI32GRU0P9QSE09GNV0EKE20===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-0.dev.0.20250306134408-5d2da079a295:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help exp"
										exitCode: 0
										output: """
												exp groups commands which are still in an experimental stage.

												Experimental commands may be changed or removed at any time,
												as the objective is to gain experience and then move the feature elsewhere.

												Usage:
												  cue exp <cmd> [arguments] [flags]
												  cue exp [command]

												Available Commands:
												  gengotypes  generate Go types from CUE definitions

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --trace        trace computation
												  -v, --verbose      print information about progress

												Use "cue exp [command] --help" for more information about a command.

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
