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
									removed:                 "8AsLybwc435EGsgexS46kv+Sei78WkB2+cVfc9xG5BA="
									changes:                 "bVVPi6eGwvKB36LgY9VxjbNaLaqcXA9eECJDXAtMFes="
									"changes: updated file": "fKGZPAOQtv2nji6QGcR9nRFaDn0w9o/N6YW6RILu+Io="
									"references: broken":    "vmUnQfSanOofyUl/6NUqbgUydFqOYYpXiVdTEiyNbZ8="
									"references: fixed":     "6hQOKC9G3GwmA2G/9wPlxQAMj8HS5p1C0erUp1Yk5zA="
								}
								multi_step: {
									hash:       "K52J4M28I0GT9BH85QK8Q1P9QE9F7UCVR6NBMOKTKPR5KIPDVSNG===="
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
