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
									removed:                 "q0rW+sPjx7JbjJ1nIoG/t9AcRv3uMyJLhCia5c0qXmI="
									changes:                 "Bfa8vV/fBQtTDJaEIXzuiQIu2mhIjJUP5LW0SbMkxY8="
									"changes: updated file": "Wn9sWaAG3YOcLJsBd4ePrJE6hvvTUw1m567EhteutB8="
									"references: broken":    "1PmAvkH468/9NaAFjpTAm9Vk1iMF7K38hNPoAMwRnT8="
									"references: fixed":     "cgs0JZrduZVrSj95ugZqwysVH5SP8JEyAitnEmAKB0c="
								}
								multi_step: {
									hash:       "506OPHI547L5EQAA14M5FDBBQB3BQQP5VABH2G94JB7N1BBMCIH0===="
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
