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
									hash:       "J4N943D0CLHMKH59GLI9OB3VL9MIFE10E4PSGG8CESB3KLJQTJ4G===="
									scriptHash: "36SKHVOMML1AJS1T148378N8AF2R2KC646L2D7141R8SKGN38PG0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-0.dev.0.20250305124614-153fc8a559ad:$PATH"
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
