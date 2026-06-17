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
									hash:       "98SLEK7DQAQ0162EFD0HUDPNB3UETR20LCFT03UJA5PI012NK4I0===="
									scriptHash: "HESDOLU9FA9PMVRICNC313VDPJHDCF7PJUR3T5S473I73RQ8IAD0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.1:$PATH"
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
