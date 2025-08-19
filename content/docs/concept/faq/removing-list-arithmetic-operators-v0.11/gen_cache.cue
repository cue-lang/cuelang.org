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
									removed:                 "+KzcqIhmXSSszRtpLXa0H8ryctL97b0Pjh+ciBA+Yec="
									changes:                 "pcXsh+nxbv+g5yqR6ZOvGyRE+xb13Y7l/y/BaDEtxrU="
									"changes: updated file": "+xsnY2nnjHUKblCdxwgj+t7YRlOAqyOfikP2Q1nTDJM="
									"references: broken":    "qqcKXooE+qItStqcRCEl8TRq3mj9EOYmUpqQcnKzK4o="
									"references: fixed":     "79CFHn0Vf73Z1SCaY7uB+t3swKtbDzglluBKUqtvtxk="
								}
								multi_step: {
									hash:       "QQPUH4RDPD6O73BN85T5T8HAJM46O3O5OM99UBR8LPF4QHVM3D8G===="
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
