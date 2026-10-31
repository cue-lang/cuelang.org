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
									removed:                 "fwsDy/izcbqAz9BfpbsSX1piBF8b8WiuhhXjIBiFqF0="
									changes:                 "gIcJ0Y6FI/sm6BU82Asl00oIiGGhy41jDftCgV7+Hhg="
									"changes: updated file": "E4Gct6pUrWcA0gOYmnlf8YznQP29Ir2HyKn//HGaioU="
									"references: broken":    "R1QxMrGYRPYoyRsfVflY1bLehEgQeDkz9Wln7KQi1oE="
									"references: fixed":     "J2mJuqkpNSTPgMgIX22j86jsy1KTFCcRhspCGndoR/Q="
								}
								multi_step: {
									hash:       "72D30OCD1TDTP3DK6RIQBJV22GKEA2FHPVGDOK1JJR5QQVDJDQFG===="
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
