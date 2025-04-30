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
									removed:                 "xr2GagZQ3ZYtM9UU44EcTdHQ5bh6Ysceio4JNsdbVho="
									changes:                 "SuUrMegMQQJ7LGA4TP/vx2dJGrpgcs/FFZ0El4DrSps="
									"changes: updated file": "/NjyjG0IGHuPwkSlUbi8dBELCVIq7JkjzDgXh+XaDvw="
									"references: broken":    "BqqMwEIv3ihBi+yAk4+4rv0gDekfaumxr88bzqGSkzk="
									"references: fixed":     "Cf+6xXg61BCg9lkNNZbGqay7a1G9Z+0eVsq9xMX0YPs="
								}
								multi_step: {
									hash:       "HLDO3BDR2OQQHGLI1U2MMS0800I6O0VOQIOAA6F9GP2NB874F9OG===="
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
