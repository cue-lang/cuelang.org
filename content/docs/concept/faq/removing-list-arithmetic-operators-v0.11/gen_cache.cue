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
									removed:                 "89qEjt5WrW24LmryQ/TbOZScT8wUt4btDf5l/b449ZE="
									changes:                 "0DCoD1No5Mia1ljoOIHA15Eb6f2ANfOxj6uMb3GMHE4="
									"changes: updated file": "YlXDPA9F+Nm1tHI0R0p6RAdWMNhyRbDJ99vPaxQnNx8="
									"references: broken":    "G1ICCZp+XHFGBemE93YYdRLAW2fLUUewXXPPXspwzQQ="
									"references: fixed":     "Kzh8kWNaEqWf4HIdlrK+zUjUYRJEVQqyDknJs7lQOyI="
								}
								multi_step: {
									hash:       "BLSRS4GOKD582HUFFAU6O2E5R9CCQGNDGSB8T7BU6QGJ7L9SO0NG===="
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
