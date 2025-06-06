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
									hash:       "9I865AA7T1TG9TB12L93ADVH0342E3NGNQH2249HI043ME8J3TN0===="
									scriptHash: "OU6UN6SB42NRQEQ1HS76J0UVK48ILM3KAKM6268RK5O1V84UK7B0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0-0.dev.0.20250606135340-250524b0d6e0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help version"
										exitCode: 0
										output: """
												print CUE version

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
