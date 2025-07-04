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
									removed:                 "NaO1TstN+H7k+TslGRpoqboqQ2nc5tcwTMkZrg7y4aU="
									changes:                 "YEMqDgLz9abBWG2jOcoDSV/GLeTKSS+Q+4rE0EQvaz0="
									"changes: updated file": "qp7oUpqOjiFgrMZ+Gdwk83uGDGXmzyyOccEYV1NcrXw="
									"references: broken":    "L+/P2VpzXtgHF0fA+6n8MsLAyoMq/baL0+YIXfC9U78="
									"references: fixed":     "4zxpPmlKYVBt9B5wogK/c1iUz+ET2wL8T50KnbnYSlw="
								}
								multi_step: {
									hash:       "I6PRMJA0GQLIUP026IHIA78KLAM4KGFD17QG8GI5A6ITBRODQVA0===="
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
