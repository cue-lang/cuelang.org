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
									removed:                 "rFKFja6tpwsaOpNSQnukBsLP16v+ZFLUk0sI8Yzij2Y="
									changes:                 "SH91eju+OjaFC+hYnBMxzBkU4dqGiJqW70Cf3/qaSKk="
									"changes: updated file": "MmXe5zDpLSHbmBbfpqJr9gcMtxae55cOlloE70qZNI4="
									"references: broken":    "2LnJNwFI0BK5sZzbsUyYW9iWq3SejKKfeEz1xhO6fG0="
									"references: fixed":     "NPEAEW2F7a6KD5qE7CNBTp40rdG63pniwzo89eRC7+A="
								}
								multi_step: {
									hash:       "FG2V0FO6SIK0CQUG3PJ8JC1MI1KQK1JQ67NSG69MN4U1OMBIN6JG===="
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
