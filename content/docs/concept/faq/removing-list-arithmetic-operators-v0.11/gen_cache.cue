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
									removed:                 "CllFOm97dg1bJI63wgIaDCnPDUnxdsDN6RC8RCRXKP8="
									changes:                 "6ugbX0XKAGrZBghe+KVVNGqcxk29EA8R1oEZsYVBlJ8="
									"changes: updated file": "fDu7ovEmWvY8RTb7D5u/wys+8dATDmqEpVRiw2tN9Lw="
									"references: broken":    "Ptvb3D6tGZ+a3FAWmLncvag/CM4U0pWFZgjDenotxRA="
									"references: fixed":     "hBkCCJrdW/Nx1yhErfDuMZJYVo1U8eVIaMUej3j5PZQ="
								}
								multi_step: {
									hash:       "BLRCVH6QH714NH5TF2VBEC90ABALBS9INFEP0IK1J3SARM0VV6A0===="
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
