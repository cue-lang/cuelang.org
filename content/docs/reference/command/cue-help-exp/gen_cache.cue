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
									hash:       "L33KC6MR1F45SNCHEGU7E37BBJ1ECK1DDKON1MU6TIH9PEAETTJG===="
									scriptHash: "IE8UOT7DJPVVFI1VSBN660C3AQ75I1R2F5M94USLSPOSRUTSDBKG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261119142547-4feb85fac20e:$PATH"
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
												  ast           inspect and manipulate CUE syntax trees
												  gengotypes    generate Go types from CUE definitions
												  writefs       remove and create files in bulk

												Global Flags:
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

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
