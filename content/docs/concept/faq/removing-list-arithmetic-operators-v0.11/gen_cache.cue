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
									removed:                 "JCkzRemXXPoKDIKHq15HWa2r7M/8L1R5O8HWErgpl0Q="
									changes:                 "/zeXCPSoHzNsYaW0yzrsCNQgVEXxDldnAzRC6S0bmfs="
									"changes: updated file": "sC2w4DeJ3woqBcS87BuiHtVDM44b4MuN/eidMdF4aVg="
									"references: broken":    "8l3espYDcNi212iWGQUY9nZtV6jw7LMk01Hvw74VheI="
									"references: fixed":     "A67uTu+n1Z7W2MjWdElmaJWWslrkV2dKna1+q8bZ9e0="
								}
								multi_step: {
									hash:       "5O5E6QTTHT7RQLLR3UPI5E7GTPJ8Q8VSD7VQFBEQ7U9NT103E22G===="
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
