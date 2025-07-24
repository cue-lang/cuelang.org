package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-refactor": {
						page: {
							cache: {
								multi_step: {
									hash:       "D0VELCAT0VTTDKVIKDK1ASERTI3NKFU7J6SEU1OO75IRHBK7HBRG===="
									scriptHash: "5HSC78O1L0936C5F5OQEPJMCDT7QJNM9R87S3K6QHDSP43SSHFJ0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0-rc.1.0.20250724155554-6d101321cb41:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help refactor"
										exitCode: 0
										output: """
												This command groups together commands relating
												to altering code within the current CUE module.

												Usage:
												  cue refactor <cmd> [arguments] [flags]

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
