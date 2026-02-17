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
									removed:                 "Eh35LBjT35vH4PGTcnrLySEsdoYbTYf2L3G3Wpkug9A="
									changes:                 "Tlnqve22wjbLPCeAB32kZDOnkQ30/qzjYzu4AWhCT9A="
									"changes: updated file": "gI8yibkMDZEmHb/f7Mbj13en/x4B0IEeCFUiWcDY1qM="
									"references: broken":    "ww5gNGjA93YO9XWvU80KKPrC3PCFCdxSwLQBuct2yv8="
									"references: fixed":     "wq5A2rkQMx+gjoAQUKhdYQgP4dBRxrdMUJDPaoEbz10="
								}
								multi_step: {
									hash:       "H0TPO7A35S8RQKULT839A2T43M5K8PGARSINRHH41QL5LNI1OSKG===="
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
