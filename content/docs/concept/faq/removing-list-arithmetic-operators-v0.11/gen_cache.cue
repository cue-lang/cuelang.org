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
									removed:                 "6/IX1BGZ44mxiIYr64nPFi/J2SHxJP0COL07uarZay8="
									changes:                 "83ArBXuthZjMeyC+zLB6xXT3sLvux5MmiCJhPlgxZlM="
									"changes: updated file": "znzvoeGotiqj4PAs7lWL4Wk8m7sfzIEm+bIiPgdazFo="
									"references: broken":    "Ogh99vMlAlUNXl18ViK39ylXIBudyGK6roX+BBXn79g="
									"references: fixed":     "UbQKBwAwgJhzuh3XB62nd2SVMts1uEdPd6LiyACvUEc="
								}
								multi_step: {
									hash:       "VDMS2IL28NJ8064AF9E5RV2IL447L1PBJF0L1U3JTME8R43MD080===="
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
