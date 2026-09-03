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
									removed:                 "N6LljhpqmsgHJseby0PXJCkCpCc0Oy+l3iWdXiB79/I="
									changes:                 "9tPpsoJ1WAFC8TvHJr+3PhCYemJAah5fE9+KyImPuYo="
									"changes: updated file": "mDprNPzwgqFTeIlIvc6KjjTeRwwRj3wWGanjjiI+o0w="
									"references: broken":    "dLSpB3VqamQtYSihKhxMN2Pb6Va+nXGbiUZSGyOzk+A="
									"references: fixed":     "xzMduR8DrIwKk8axaRvHrhuf3ZNDjBRJ/vGOLOnOYNI="
								}
								multi_step: {
									hash:       "368FOT69G7L90N5581GHI19UIF45N3LFIVSUB3PKQN3OSDUOG09G===="
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
