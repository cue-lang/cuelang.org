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
									removed:                 "jfYKCd2SqXo/0BABISZm2POW9WBVH4YGjJ7aBD243W8="
									changes:                 "i4UCcP0dMkrffHOVZJRbkLOD/BebakiAP+j3+kANTN4="
									"changes: updated file": "a0Eq4W4tPwYy0+fApYuCxKFfffXq+qj+WRCFnh6xw+4="
									"references: broken":    "nruvtW1p4qpHPkw90forC9Ybmr5MreHK7kvJ2vqIvBw="
									"references: fixed":     "CckiZovTLH2zDexY6iJnpCT+j/duIGWG55DQqsXO4Q8="
								}
								multi_step: {
									hash:       "8C5E2ONVSEMNKR1K0SCNNE18QPPRDTF1T73EVUSKK1E17SVQGMEG===="
									scriptHash: "NK5CEA6CUR4KTFJHDTJ0HLDFL6HC1RNK8VP5I0RNME3JEKM8QR40===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.3:$PATH"
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
