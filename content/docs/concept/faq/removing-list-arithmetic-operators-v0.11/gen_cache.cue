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
									removed:                 "RsvLKLPDVmGYdoBipSLzAlKvrliV3M5suIqYM7NAWpo="
									changes:                 "3ri/LXtLnCJb1U9nwoqfF8vHKBYUZBdePf2s6QjcBQ8="
									"changes: updated file": "7VUt3XcuJQTcwuXza6JWcnqAqkVg6NL9H3FBjTUM1pI="
									"references: broken":    "0O9IIRKqnAddOQs+s6R3lZZ30so98+yFUXpl8hybQJE="
									"references: fixed":     "uuxAUCQOHpZSY/dX9bJvXZyQxSVBlw8Tx8jln0kE2TE="
								}
								multi_step: {
									hash:       "HBMFGPMIO08G0KSHGES1Q0IKO24N9JH6QUQRMAIFPIK836MEVA2G===="
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
