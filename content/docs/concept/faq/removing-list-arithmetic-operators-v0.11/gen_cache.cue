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
									removed:                 "jnQDyXhYUzwyEE8ttPC+cGt8KbMtqFg0p2dSsOA92u8="
									changes:                 "zbj0XF+C9Ji1Dp5qOjctSx36hUI7ZYrQSFdphURH6hI="
									"changes: updated file": "qoPZ4BFs8wG/Pz0rkGBKMxIIAicFPTC29JwOeNNgS3w="
									"references: broken":    "HkIxQx4mjnP5J2nEw5DPklX8z3C4xq+2dbc2oyiFyfI="
									"references: fixed":     "uHZi2ho8OppbWU60br89z32JBbeEkzPddkaxyFe6fPA="
								}
								multi_step: {
									hash:       "LSA4GIH63H2587KMCHQP38740GIHRM3K07CFPIM231GSQ84FP6AG===="
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
