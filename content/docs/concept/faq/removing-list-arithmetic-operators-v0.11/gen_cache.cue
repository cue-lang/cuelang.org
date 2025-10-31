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
									removed:                 "DPyELpcA2gCq+RJZPOzOT5Kb+DSJeZqXo6as/rKK7O0="
									changes:                 "NcKmqgs1zkcpCb7+8CqeqbakIFJ/a6Ry6PV+4NpXcYE="
									"changes: updated file": "suL0dHsML0NTyRJeTNDzt8zi5Hs72iKsmisoCaD4k9U="
									"references: broken":    "bPLwtSWAWd5aCqkR/M6dCOJQ6l4B0JgD9PdEeIShlW4="
									"references: fixed":     "mCA3fRd8DV83bEIkcysmtQK4Iu5s3qpFOOMa/YyJ4ck="
								}
								multi_step: {
									hash:       "ISQ9BHI78MLM03IV76SQEMGM3S7HDKH7LPVSH5QFN899KOF1KQPG===="
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
