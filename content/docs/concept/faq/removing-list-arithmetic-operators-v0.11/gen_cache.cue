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
									removed:                 "lr84/rNNc2rwyO32TeA5IfiyxOb7EVhk0opdIYYu3ds="
									changes:                 "lTRy7erMTmggutMyWhN9MEyifiPUdIrxcZmZZ9bBbZA="
									"changes: updated file": "93jTkHeFBKZkFdO3ryRJCFaFxMBGOdmG5Hs+rqd2I7Q="
									"references: broken":    "vU/MArsKcbdQujqjagkBeRoa2S11rkYqGvupLmhoTAg="
									"references: fixed":     "8yWXk7ALUJMgT167mDprYFPwK68aLwezzvggNyGewXQ="
								}
								multi_step: {
									hash:       "2RNMT2RLRHLALQNDD2RJ1JO8VU4BP0232LA0ASUFEQMI07AJ1JU0===="
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
