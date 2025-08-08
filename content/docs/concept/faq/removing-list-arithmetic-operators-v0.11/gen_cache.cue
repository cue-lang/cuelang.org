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
									removed:                 "fi/499tgPS8HP8SaMzjIi7F/h6Xq4DI5qrGy7fxmzpM="
									changes:                 "0jICg8+ZEk5fXyjUSDqg4ylQzX3s+xWYTeLF04QekWM="
									"changes: updated file": "iDexufoKvNEKm4kotePTRd0xZf/lcxiOQ98lUO4Ynoc="
									"references: broken":    "bOzYZkXHxoXXaAK1F1XqP9dKvt1QZx/zXUG5vdCYpgQ="
									"references: fixed":     "ZgMa7vNB3kYgRNVqtHG2JK8YB3zLNO5QufdoBcJBdsE="
								}
								multi_step: {
									hash:       "LADRB0204AQGS7CQNTI70LK0SF2I5MNP4ND004RLLNUEBFP0OPO0===="
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
