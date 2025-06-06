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
									removed:                 "KYmeaVOUJKFYwXc5hW01+WrJiiOspMJm8f02e4u5W7Q="
									changes:                 "0T23F0nFBF+t7X5kGnIh+Fcbsx1JnnFLU3cvtCdG4Uo="
									"changes: updated file": "jMrWO25a4mNA3T6Oa3moyFVEGVqSTKf9n2rarn72d9U="
									"references: broken":    "20jAe6uL4IgQJN1VA7+dXk4Gzof9a6T6AiTrM08sHjU="
									"references: fixed":     "xC07yNf6BLo6X1nYRLT1IBHu3jy4hcDgSrhRcGz8nQ8="
								}
								multi_step: {
									hash:       "U78M0R65M6KLSOM5A584T161DNT44HO2MLJQ5PPEVJ1S7I49GO7G===="
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
