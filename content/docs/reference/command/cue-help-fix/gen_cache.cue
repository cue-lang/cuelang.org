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
									hash:       "JBSQU4Q6UKQB1O6Q25KKNNC6B02RKGFD4D8EIHM23S9COIDIT9B0===="
									scriptHash: "1L4Q3HLBCNKH4UDO1OF3QNPATR42CE71F4M6JOQ37N8QAFKKJG5G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.1:$PATH"
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
