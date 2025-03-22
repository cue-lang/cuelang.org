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
									removed:                 "gaCA+TQrasymB4IqHGtNCgDQkZAmxzEWIdRTOkN6muI="
									changes:                 "xXL/t0UlWhU8ab5ZnY8o34hLA5NXjwk6mYSURR46RBI="
									"changes: updated file": "7vrJyhEaOgMuL99YzEUkWJ/w05UtX9MUlSqkkRUEeBw="
									"references: broken":    "Q+uyOoikAUlsA6hucgHqvWGDgQ6Vg3FxMbyvkgxMkPA="
									"references: fixed":     "7cEOiq8E6Q4RG50yu09r7SKxJkuwwdQhKJRnXnLMIXE="
								}
								multi_step: {
									hash:       "7VA2ILCUNVTHQ9KA99DDR6S4C68QSC55GDPHKDV2S1698CROQCJ0===="
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
