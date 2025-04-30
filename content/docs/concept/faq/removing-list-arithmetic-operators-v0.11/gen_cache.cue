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
									removed:                 "CMPetqYo6rdXRrwYRMZmYOjPj6xKkC0DzsjvXt1VNoU="
									changes:                 "GE438gY9VxVqQPppeB9dns/4wZwAMtbChWxUvWe25Po="
									"changes: updated file": "+grHsW+5jwJsSIqAgDDi2YTlqiMq+ytmNu7x4EbCmBI="
									"references: broken":    "A+/lX1dMWX3lQI6bT9GmhGdAsiDRorWO+T5G47RrAgo="
									"references: fixed":     "wlCeznVgh0+Nm8Xy5eiojZJK6AnEZXhZNSnURBT0YAw="
								}
								multi_step: {
									hash:       "84ARPLL9LQM8F3PU5R9L1GRNCJSQE33A5C9VE4E6MG12VO0B7FG0===="
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
