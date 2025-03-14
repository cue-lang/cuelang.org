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
									removed:                 "Cn1liwNgFAzXN3wHYW/ws9rkMqSXu92CVDXf5AYkt9M="
									changes:                 "6kfaDKslMCKg9By5Fvv7kJag2vgr0LmMC0909XvKx8c="
									"changes: updated file": "+VvS1GOwjAyL277uJ9pPfnrJ7diEvlUcwZKm0MpPno8="
									"references: broken":    "L5wIgfptUG9cMR1AH1K7HtXONH/tYNoPhdgbPchkk9Q="
									"references: fixed":     "nrzgaWszh4U0zVWZN3bZjiUf1XALeL2MbTw20mA4DdM="
								}
								multi_step: {
									hash:       "QHE34H05ML7OTUDV1QBLKT8PPM2U9N1JQ419522D4N88H0U3G0H0===="
									scriptHash: "VLNGG98FUABM36HDGI2AH2IQCN9I2OP2RSHEFN8T9SKDP3F1HRP0===="
									steps: [{
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
