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
									removed:                 "OaH6LGLmQbNnsC67FM/BcMlAWZKw53b/ylusYXBg2Fc="
									changes:                 "91DkD2tSIIHdoAN/71dW3KEooSH9zyUHiPmpoXfInAY="
									"changes: updated file": "HcOG9iTrvlvSZWTM8BA2PfDO62udZG5Iy5jP7VC80aQ="
									"references: broken":    "asAGu7gt/xQl2rxP90ldGoPMdBmmYMmjEZcViv2rUMc="
									"references: fixed":     "5a0RMsapPIY2O5WYrq/GcVGwIWyZyqEB4uoDqi+koK8="
								}
								multi_step: {
									hash:       "VI6E0GE469BR6NUBCUSP00OGS6J8OA433PUM6TTBOJRMCHSJFNE0===="
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
