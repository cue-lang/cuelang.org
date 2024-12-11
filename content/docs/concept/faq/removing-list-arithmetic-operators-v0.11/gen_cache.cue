package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"removing-list-arithmetic-operators-v0.11": {
						page: {
							cache: {
								upload: {
									removed:                 "PMkxOtMOwBrfFEl3JrSdfPBnq65TDcpE1w+Hwd5XrBw="
									changes:                 "fRko+0s2zgZST/f1aK0bhAfFyITQUhfUG3q/26/6YEY="
									"changes: updated file": "TENqGzOt+bjPwZ9VIsW6wl4D1WlPEtstvlf0Binz+u4="
									"references: broken":    "hB0fy0EDX+dpnLV6aR6/AqUfNau6rTkI0CTIOLmX+MY="
									"references: fixed":     "wPCD2MMUIgBphXmGAhlfpEV3eZvK1ykYqfVy//NAwGY="
								}
								multi_step: {
									hash:       "C4VH9FFB4H9AOBPGG2IBIL248AVPG3KKBE5O3E2IABUSFRBAP7JG===="
									scriptHash: "0KTRKTURP6N07KG8A26JB7GPI48AQL4DMRN0BOL1S852BVHQUPHG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.0-0.dev.0.20241211161443-0005c227d164:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
										exitCode: 1
										output: """
												A: Multiplication of lists is superseded by list.Repeat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:1:4
												B: Addition of lists is superseded by list.Concat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:2:4

												"""
									}, {
										doc:      ""
										cmd:      "cue fix changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet references.cue"
										exitCode: 0
										output:   ""
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
