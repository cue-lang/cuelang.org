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
									removed:                 "WZ+bU5dq6wYYLyJDafvI2d5eYDxhv+U6f5g7IkoffTU="
									changes:                 "0hbua0yn0qaRYR4HbMWIAitXp0foFfoaEAAB8pbXt1A="
									"changes: updated file": "NoepWzonoHUiNcOTpksX2cwKEzqZXYLszfKuYoN27Y0="
									"references: broken":    "BV3LmGsAlp5v5ai2ckN8ddBL6aNxF1/TiesTG0SdbWg="
									"references: fixed":     "BHNaj97WKC9/MAdeT3jqfXutZ+Y76PC4GZxQxPIZLzE="
								}
								multi_step: {
									hash:       "67J5VU8E3LHOD47RSSDQ2UK1ODMMM7QJ71KAKAFHDB7I70UGQ680===="
									scriptHash: "CVMOA3EDA3632MKT5F679UC4I4EKHPJUVC9HUVMQTI7T8GV8E650===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0:$PATH"
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
