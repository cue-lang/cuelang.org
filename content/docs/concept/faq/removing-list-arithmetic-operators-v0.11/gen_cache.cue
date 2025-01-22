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
									removed:                 "7mpNhorhbwOHpER42actmjoK73sgDvVFPt0gBcRrcMo="
									changes:                 "W5//Bmex+yaTYU6IK4dDeKmzJApAyCHLwsk1N7WBuVY="
									"changes: updated file": "UhEWktqYkXYa/KD7KQZJeybJ4ANV4Qe4qo0TEVj9GgI="
									"references: broken":    "H9uH/ASNSNMgt4ezA2e+OJYZS6XsMFApyCVog3+OPSg="
									"references: fixed":     "kO5GGwODGR5x3hZQGtpszKhM5J3UjZ5AnGlQu4Tl3C4="
								}
								multi_step: {
									hash:       "P573ANB0CTM8RIVN5MPQEDBFQHDNU1JC0Q26PUU4V4UR7NK41BU0===="
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
