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
									removed:                 "K/tsZChYbxnRt2mGBHYo7S8w5y3Ng6/HWapG82SVlP8="
									changes:                 "jduOhlxkFntlZ8eohp5lPj1IU/+VU9VAi+VUHxwhvLo="
									"changes: updated file": "OPWcHqiSc3MlMZKdrfrAsH0N2V5w7MhckwFmERlJZps="
									"references: broken":    "6G/R397Fk9aA+iPfkOCoZqpDJ5vUIv+Whheuq/1ztus="
									"references: fixed":     "K24NosWxiq66d8qE7+b7zhZpUYPdsHcoT+WoC1rJkSY="
								}
								multi_step: {
									hash:       "LLSVRI4MBPGB9ONJ52NVVHUNPFBNT6JLRRJF06FQ135TFSJI6OLG===="
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
