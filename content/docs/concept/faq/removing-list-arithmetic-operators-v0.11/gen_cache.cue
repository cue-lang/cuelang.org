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
									removed:                 "SFxRup+0hMaqLhs41pgkw/Ej3RI+PHBdRRoLXsRNKOM="
									changes:                 "rm1QHCIDxVkk3eTPFKKCnpI3k6BL9KSwsuzqUi2bLHY="
									"changes: updated file": "GooYS202kCItKV+d6fkVdmrHEsJWP7Ik4jQr30Ze/+s="
									"references: broken":    "TLWDB7HhhZJToc6sVup+TRKSDjQjVJy20//hhVbwweo="
									"references: fixed":     "g5h4uxGNR1Mq61KbDNwSXvXdjTnJ0neeYOMl8UJQNLo="
								}
								multi_step: {
									hash:       "OO47CK9GBOVB4IRLHPK9F24T6FLKM78VBG98I1QM6SUIM31DEJDG===="
									scriptHash: "SG968CL2ID2LKMV9L2G9187V5QJAHTMHFHA80T860N0LRTOHIJDG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
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
										cmd:      "mv changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet references.cue"
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
