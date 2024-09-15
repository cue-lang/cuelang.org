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
									removed:                 "Ct46UWvsyX1JF3V/pJPhYrvGirghNOHYhUXSIL2lRHM="
									changes:                 "Rvue9QyWEdrVqijkq4jZ+nVo1qg5wDkt3CDlyzx10tI="
									"changes: updated file": "NOtqSRJQGdvYMrmRqv8BjWSehvqK/+9fspPV3RSyVCg="
									"references: broken":    "w6hK20JXdQOpksvA3DRkBOrV8Y+JsMgw0mgq2vpAc/w="
									"references: fixed":     "a2lrf5ZUGDcgPj14ikvV8pqQyy0FxNrViBF86nBLe58="
								}
								multi_step: {
									hash:       "Q1J31GNLI2MISDGNNCT8CE9C4K35JVQOD0QF3847LUC6GF4409DG===="
									scriptHash: "SG968CL2ID2LKMV9L2G9187V5QJAHTMHFHA80T860N0LRTOHIJDG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
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
										cmd:      "mv changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet references.cue"
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
