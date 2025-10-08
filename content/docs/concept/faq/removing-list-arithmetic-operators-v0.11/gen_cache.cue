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
									removed:                 "sIkoJjL/aCogawDY5bqNnDabpKGiOy292JHhNi6IrsM="
									changes:                 "8PnDKDva1Kzdjo5X18ZQR9flJ+L1qfhy1TwBkJVTgao="
									"changes: updated file": "hZ7+4WeUPc6G6oeA8KpyOE+Cg5rEwl2SRMgNwO4B/78="
									"references: broken":    "70P12S4fVVoXAiqoPCG86ATgbOrE93+QJ73R8JkKuD0="
									"references: fixed":     "0SH6rXQZnJL8Ck5ta/KnNCCGuO3ypYUHEll4U9ssTJk="
								}
								multi_step: {
									hash:       "FGBIDJDLB0PJITA0PGIC89DU8QPSLH1PPOTQ7VA05R31IDL899R0===="
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
