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
									removed:                 "ZlemqZZ0YDbWxKB9A1yTtUAjNKnSVLAd2v4HJLlriy0="
									changes:                 "1RvTdZl3HGxb87dWtoWas2hhQMA35Cbh4wWz1AkPo+0="
									"changes: updated file": "6QGY+G4x/SBSLfUIREJB0XVPKF39SpE0itYyHXblICA="
									"references: broken":    "uESpfFo+TM2mfFXjBewzmnq2LZ6Vgx1FjZqgMOHC7TM="
									"references: fixed":     "z62z1V57+5mANdwC+0JOReoYaJtDibiAYxRiAh1UjvU="
								}
								multi_step: {
									hash:       "USNP6CBRUT8GKBMVTHVJJA19E95MPMOCD8C7699F17PVU6HBT6C0===="
									scriptHash: "CQLN0JB91J0J500G73ET7JLAEUQ73QC37IB3PEFB4O462O83DV2G===="
									steps: [{
										doc:      ""
										cmd:      "cue vet -c list-arithmetic.cue"
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
										cmd:      "cue vet -c references.cue"
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
