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
									removed:                 "iL6p9i+gG0nip283j/Zy3zMfqR2KKxzTllzP1ezhtCI="
									changes:                 "oFay/CyhgcmgVAQt9qaWO0+dkAVLsSnHIFJ3rcbRfUs="
									"changes: updated file": "b2XzQB6bIqMgTyqyDLzENP9OnU2MokSkst/e2d+wzyU="
									"references: broken":    "pH92y68jLV6Sz8jwZKL7u8G8VVRAJ77jevgfa670QSE="
									"references: fixed":     "1VWDgs0feJHoT9a3HQZzyw6CMINuKnqsWFyXtpyV6BI="
								}
								multi_step: {
									hash:       "P51JC3F9ER6AGQF9NP8042GOBPI7L0HGCQBK26P0S40K1500UJ0G===="
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
