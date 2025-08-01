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
									removed:                 "5rjYiX1sqrQla1u3xOFMl8G97yR4+/Hn8ehYBlvtAYE="
									changes:                 "/GcBGxVPkIspglsJ+JDzKAsh+AYmGZCoi/v0jdIZ/xU="
									"changes: updated file": "fbdoO365T7hMf+mxZ17iSnwPOhJWmOXJy2mIGJs8c6U="
									"references: broken":    "vSJvM5uEvg3cD7E/SLgOMcERdlAsFrk231wkqpjWjF8="
									"references: fixed":     "k7lsln/0Ts4W/3lkh+bMBBFZ6JEZl5HyN5kGmt2a0Bw="
								}
								multi_step: {
									hash:       "2IFJVO4IOU7E1HICE39GT3DS0QKRB1P9CI2AH9H7CKCN9EBK8U40===="
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
