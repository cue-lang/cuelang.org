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
									removed:                 "nuWgvhLxYD/lxSKVKKcbB1KcrXKsGg2mkC2WE1ATiDI="
									changes:                 "VDVUTvjnBLbtUrJDSaUeIYYlCDZuzElp9MyUfi+4YFM="
									"changes: updated file": "1kh3+hxpJ6BThs3zx6Yt5UmzDkeaS9GlK4LfEMrSTL8="
									"references: broken":    "mB1xtD32bgHd7JqLM8ZhhzSAUECr+GxVgVZTqDs+Vv8="
									"references: fixed":     "ml+FjVXMeoiILKnhlDgXyWFqHs7bn0C6GVeUmn9/zKc="
								}
								multi_step: {
									hash:       "IRB4F3TLAV3218HQ358E713OUGJE21E2QBM5H69ST4LOD5258J4G===="
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
