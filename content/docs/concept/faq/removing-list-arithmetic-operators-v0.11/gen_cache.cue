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
									removed:                 "fYj+347lDbnrfCGS3eLrBCXv7snkJZZcdL+Uc2yZ8q4="
									changes:                 "UM3064RCae2nkKPzswinfXo1W0Tz2UYDlDSNOJPKAeQ="
									"changes: updated file": "yh0OIPdXiZM1ZBdGc/k3DsVgc7K0E7l7QFyr66TsGio="
									"references: broken":    "RBAwu25rGxNZJxtQjvimmcSKjiMW+xnUJaEr8+HsiyU="
									"references: fixed":     "FTRNDJLdaxX3rHflpx60mheailsUFv7cQZK7HAusNwM="
								}
								multi_step: {
									hash:       "MBJ3OI7OHKLIT5R618DQ3E3V8C0B2TNR623JCBALB4MJHRNI14A0===="
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
