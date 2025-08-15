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
									hash:       "9L1VT54SGFRN4TO7A90TLAU2GI0GGEG1C29MTBPNI46MS62G7OU0===="
									scriptHash: "TSUN2TNGBRH25DEFBH3S6QR3ITKC5I7D03SPHM4K6HOL48C5KAL0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-0.dev.0.20250815110336-a2eed3278a6c:$PATH"
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
