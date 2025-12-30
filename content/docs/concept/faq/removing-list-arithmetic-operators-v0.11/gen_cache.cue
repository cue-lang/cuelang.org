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
									removed:                 "ZFhGvZzzj4z6dbCr4uENxG7jtkV3V0u+/7iI3FyyCow="
									changes:                 "6aa2i/KB5u32VOcMzdDG0UGYJ19THwtLkCycbfMZWOE="
									"changes: updated file": "3tjGzmQDMfQAgw24mAuj9BipuKdAt8D5yxElr/gihIY="
									"references: broken":    "Dm2e84PGZtM1N5Zqoj1epG4DrJ2mHdBXv3tvxxYYV1M="
									"references: fixed":     "KX63pO/m1OqVKM8Uz3BDc2mkRMhb0iYtKm7HuABooI0="
								}
								multi_step: {
									hash:       "8KHMVM3H515HLTR12NSANT1D2KTN1V5AOQQSMBSQR9LDPUG6CK3G===="
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
