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
									removed:                 "fWnZrnv8j0UHavaQgC28Tb05s593pif0VIF9f4b+6Gs="
									changes:                 "YN43KI/ys3TYa3Gu3esg+GEH2eWFlA/Qxi1LgwonTJA="
									"changes: updated file": "5eX8lIKf5eBnzW3KmojUv8+paOyZeAM0Agr0L/ce4r0="
									"references: broken":    "KfYHILTxrP36kNweFdT6PC8HgddoX8IZYYjAwf6kWkY="
									"references: fixed":     "OU+e37FcoDpIJE04aeI+eRGvpaW6mM97mG0WPmPwX1Y="
								}
								multi_step: {
									hash:       "GB69UETBAULC52O231NIPTDNK5CPFKG7EA8HUI0F9PDRAPHGFT30===="
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
