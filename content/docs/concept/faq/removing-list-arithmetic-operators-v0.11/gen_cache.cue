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
									removed:                 "uKSSGbr3XQU9JbF54X1XbgXl5Xv1DTXkRdFED2I2JBU="
									changes:                 "VdazENGRZXHMEevAQA3h/s/vilX1DJO1pBkOJ+99ceU="
									"changes: updated file": "E/+xtpB0AjcLRs1bVmAznp7w5TprJNm8/44Cmt6K3Yw="
									"references: broken":    "z4GUQgSOP4d9eam+Y2PHE95nXb9vhAauZ6pIAybjbq4="
									"references: fixed":     "3y5EU2qH8uvCirjHaOZdwxk9B5qIxaScUDjM+gyXFnw="
								}
								multi_step: {
									hash:       "HJMGTF0CSDNNKQV21URDLB8A8AIGRURQ0G7E6EBHGQER5GUMDV10===="
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
