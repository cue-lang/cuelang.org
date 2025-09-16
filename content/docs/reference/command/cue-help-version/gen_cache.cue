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
									hash:       "I6I01KVOP5Q44L2HOV7RBO9DEHUNVNQ1RJU66GM2M4ASR5G3QMOG===="
									scriptHash: "DLBB7CUSTNJLDKONP6M754FIQHTUCL57R8C34NM6E9VQ1RQ5HI70===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.2:$PATH"
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
