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
									removed:                 "mCml+E0jhpzr39hrOTkDS3DZQfBtWLAXTIlSW8YLYxg="
									changes:                 "QHXHiUOzwkLKVX/OPNxZeG+QEIUEvL1dgvbPcYC/aYk="
									"changes: updated file": "XUqmNB/kkn3i/iaRfHdeGIFdsy3LJgltiYJ84FJN1XA="
									"references: broken":    "4bSCJv36UkggACq6CdSZ5UJnuL+NUmT6IhNsthIgXEI="
									"references: fixed":     "IAidbWm0+sGYh2PJHzo574mavYzUMCRsccw9hVERLrc="
								}
								multi_step: {
									hash:       "CJK36L0EUE7PTKFOS59AB65C9MUD3BRN8574LT6FUDAIR0CTSM80===="
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
