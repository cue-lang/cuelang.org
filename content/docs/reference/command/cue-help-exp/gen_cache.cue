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
									hash:       "J085H3RD5MQBT8J0BIQ5VD711CSFVMGQ6MGF9R45OIOOO0ECP18G===="
									scriptHash: "QS52RDR607C97PVK3R046JS3IKD6TMFK0NCCQAE67RM8O0ASB1P0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.0.0-goreleaser.202609101448:$PATH"
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
												  gengotypes    generate Go types from CUE definitions
												  writefs       remove and create files in bulk

												Global Flags:
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors
												  -s, --simplify       simplify output

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
