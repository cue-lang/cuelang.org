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
									removed:                 "qIGxzymwyQYHQ2PnHoD8uC3mfIVnVfDYREIIFX5qm0I="
									changes:                 "u88WZ0w5053Rc0Pepz9MLiaCLxPGptukiW+3BLkArVE="
									"changes: updated file": "Ehqs7C6Zw9ZtueWKVKlYeJSrcTfcBB5sz2w6gzY+0XI="
									"references: broken":    "dh3bIPkJBf2N2Xic9PNvk2iByzw0ykM9BSZNMYhrjTU="
									"references: fixed":     "GRkdmmD4beH+mAA6LKeDGtQV1965dcz9THbjmrcmAc8="
								}
								multi_step: {
									hash:       "Q83344RHE2FJE4Q9B87C31T8LTO19QMVS54QRI55J6O6963J86AG===="
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
