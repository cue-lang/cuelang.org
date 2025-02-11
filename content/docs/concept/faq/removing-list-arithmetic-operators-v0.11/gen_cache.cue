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
									removed:                 "zWlPGLYkJoWTJ4kr3SjZprGnf1AWQNtjHtifwelM05Y="
									changes:                 "S/ldgbG4kGgX+dhdz7/NPqCv6PmAg2szFhGFmplX4Z0="
									"changes: updated file": "j3pDHNNIfmJ6tlB2xlxIFmb5GKl1fn/HHR0beYZ8xJo="
									"references: broken":    "vu1SviIUhZnEJgtBKyXjeAhFdTbFl7AsYtLkMbMg0Oo="
									"references: fixed":     "ANXVKPyfpv/M/383yXF+8WnRdFr1hHT+Lain1cOVSUQ="
								}
								multi_step: {
									hash:       "7OEK8D5EU4N4L7R9CR8QI37UN0KFUU8GBMVEP1COQH8OA2A82TQG===="
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
