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
									removed:                 "HZWLose9pG8T4RpIOw0k0BZVnE3qV9J2jXmqm+JCgI4="
									changes:                 "Jh8izlVKysMka4Bsmlg0rW7Pw0Df96AC1UBHv84UCQU="
									"changes: updated file": "OLHHyBUkHEFdbJ0Pw45i4nJZQcdaf6ZD0lfZ7N6ntyo="
									"references: broken":    "vtWy8ydl8eJ2i7hnEaBknP2Pwgc8XrfxUKEqXgujmHg="
									"references: fixed":     "2tyC5yfnYWqRDHNwWXBJw4ineeBceU5zlHY0X9zu2UU="
								}
								multi_step: {
									hash:       "56V3S065MKKPEVUQQ28NC5BSP0GVRP2SSUG9AIGGSQC8B2N0PEJ0===="
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
