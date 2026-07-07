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
									removed:                 "BUJFg6RMSI1v6V4sfrBVg5F9X0PSD/jIWirUC1Mb6kM="
									changes:                 "VlGDpFJEM87y+ArLdQyYXXV8rg3pee9YF5PyfxpVve0="
									"changes: updated file": "LspHPSQmLoopBcYRrsvOQxDFR6PKRgEEaG44gVLTEik="
									"references: broken":    "Jf3YS3o8/C5c8WFRaIKhK/9kSZ+kq+/wMD2Kjv3+fQk="
									"references: fixed":     "ACY4I333E2EgoTEpYFgWLdW6vUfrBnsS0Yw28pRfYys="
								}
								multi_step: {
									hash:       "V74RAVN4UI8GJ7LAQUQS5G0SJKCDKCA9090V9QBQ6FS7S5MSBOQG===="
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
