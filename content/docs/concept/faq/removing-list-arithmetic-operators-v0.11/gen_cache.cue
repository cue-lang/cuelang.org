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
									removed:                 "TroYNEYi+8okJVccOiyk4QpfZyejMo+es6mb8Lh3SdY="
									changes:                 "mSPSkf16354JBwg7yiBZG/aA2AxfEjvSIKAYJAvj/Hk="
									"changes: updated file": "J7+3sye83c9PmP6UI9qdY1EHH/8aw17VpOhtXLheG6M="
									"references: broken":    "3vQDpxbXDHxo/QcG61VDMQxRW0HA/+DsPAVzyCf1Ixk="
									"references: fixed":     "8CNEw9FSrUNVANLKhQZff7TEkUDI2y+H7lNjVWfdOVs="
								}
								multi_step: {
									hash:       "VHM6R75AQPR282VGG32IDR52PO7JVSJUR3NC4F856PGO145H0OA0===="
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
