package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-version": {
						page: {
							cache: {
								multi_step: {
									hash:       "7CK6OI04C8KBU3HKMK62EILQUN697OQCS6AHAJUAH58249MC7P1G===="
									scriptHash: "DHL1VLRHI3SJO992L46BBLH77EKIAQHB28CAF6P31A2FGPG91JQG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help version"
										exitCode: 0
										output: """
												print the CUE version and build information

												Usage:
												  cue version [flags]

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
