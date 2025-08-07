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
									removed:                 "ogF1TBcdzGkri4bi4unsDrC9vrakbiluZdV44WEj6lw="
									changes:                 "eBUGYhOYw9gi9sbjRwZ/TP0AJsAweXj7ZSTTHTT8r4M="
									"changes: updated file": "DTo36JpzKYQbqilAW9xPApa9y+yTDnW2Lkk7n0eRxOg="
									"references: broken":    "Vv80fMCdXTweaQr/h3/CVzM8nwFMnonPBKFiy3yRoDw="
									"references: fixed":     "5RIeu2bhA7hLkI5w+8aCGvvomokVr041Ok5H+7y9ulk="
								}
								multi_step: {
									hash:       "LRES6DUP2N7QLUDQFPL0J2CKULKITMQEVO4M4C8A1K27GTNHSMR0===="
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
