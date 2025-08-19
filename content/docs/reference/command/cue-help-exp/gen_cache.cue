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
									hash:       "D7NG3EPMAR0FLN7CADFOQOLMO7P2OF45VJ5LPMH5K6U4UL7B8VTG===="
									scriptHash: "NVBC8A74CIVT81FJ391ICCPQH34I3FMIE71V0U3VEKMKKS7D4NM0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.1:$PATH"
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
