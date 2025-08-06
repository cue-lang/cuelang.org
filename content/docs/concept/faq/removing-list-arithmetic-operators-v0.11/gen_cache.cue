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
									removed:                 "6qyEFVrgBrjv8U8bUPDvAUFX83gJsbNNmJt2h7kcZ0U="
									changes:                 "/80F3RBxNTWBJYvwvrsLjVSYwzsKx5kvEo/PBWrKIoM="
									"changes: updated file": "C1hhLKIPMiYRb8BZzZ4JmdY4NZCnjpGMO4ZuhELqXBk="
									"references: broken":    "G/TZjvekEAvf4paIkagIr+QiLz4SXbzaYcR3MKzD4DY="
									"references: fixed":     "TaOr+QE905Z0Wiea52y3jsoJ8/jDrx+Zx0N/SK+NREk="
								}
								multi_step: {
									hash:       "S0KMVS3AH5CGHLF0EI1MA87LS98DG9RLG3QKIH97F3V827B95S9G===="
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
