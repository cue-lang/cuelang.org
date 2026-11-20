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
									removed:                 "LtZ1gI/MeeFqUkvUKjstOdg/Oz/jUbeJDnEURgdbT+w="
									changes:                 "TuMUDQIwoY22WW3V12jGSnlz1pa6ct6wYo9s4zqrHKQ="
									"changes: updated file": "cgbzG3YmAE3C1LOFGQx/c29fl0mT9o+uiV7NuVHgu4w="
									"references: broken":    "eehj17zWSBBTE6StajzBx4nNVzmhdL9oqZxG0uQSYdM="
									"references: fixed":     "xYM9UhH4sD+rhY9kHfDAHAjkceOo+yNKa2Ucf7iC3oY="
								}
								multi_step: {
									hash:       "K1PDMBJ24E9HOS2E1VTS00SGINFTOB457EKEJ3TLG9F6SEQKBEI0===="
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
