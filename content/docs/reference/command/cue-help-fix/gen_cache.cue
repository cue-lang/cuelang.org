package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-fix": {
						page: {
							cache: {
								multi_step: {
									hash:       "60UAQ4PEU5V47LR6EBH70B65V65IL5SDF19HU0LJNGOG0PVJUG20===="
									scriptHash: "774EVVLVECCSRLEMQ7ARPVVSSJU1F976SEI9QOE915DDVB6S6UQ0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-0.dev.0.20250808151001-88adc227ad53:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help fix"
										exitCode: 0
										output: """
												Fix finds CUE programs that use old syntax and old APIs and rewrites them to use newer ones.
												After you update to a new CUE release, fix helps make the necessary changes
												to your program.

												Without any packages, fix applies to all files within a module.

												Usage:
												  cue fix [packages] [flags]

												Flags:
												  -f, --force   rewrite even when there are errors

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
