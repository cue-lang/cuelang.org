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
									removed:                 "BMvxGtzd/935Xx/GUfVKj2XQYg0df3lVnbw1CrVwAWg="
									changes:                 "yOvjDgylNVKe12GcfPrLCQtaKPHGbaNa1E+bidLsls0="
									"changes: updated file": "8ZazUP9zrLPQxnH/RRqYtq4yY9J9en4LwJZxfpcMdrE="
									"references: broken":    "+/tzrwiLlaEG8byC0ZmmJwIXDygxy0LxNfzSu4qR1c4="
									"references: fixed":     "6u6C+21xwRbLcUJHBwzJy7hsGbgQ8Meqdes3J4F8mzY="
								}
								multi_step: {
									hash:       "U949L90UUFRRLU84GAKJHBHEI18T11JMS7LVDN067PJUCLO2L8H0===="
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
