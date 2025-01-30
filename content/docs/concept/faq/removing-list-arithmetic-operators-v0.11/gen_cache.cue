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
									removed:                 "iHS+1dP/E0rrU1rrd8Unv+KsgrFuRnfujZgem+T0Ub8="
									changes:                 "hAC4PnQ/GT0pdqMUukpOgmLPxrr0F/9TFgmiVANryII="
									"changes: updated file": "7GCaksrDGWxPvRqHM2F2LPxt9E34BddtYPtgD+3amrA="
									"references: broken":    "h305HOUXrprPBK/e2pOV2YXOXDS+5P3oBDpgbTTSI28="
									"references: fixed":     "vIAdXANj8vOvvDkd0qqhnVd/fBmOzqVWIcUf7JmifZ8="
								}
								multi_step: {
									hash:       "98H5A6AR9PEIH6GV16TD4ES08A2CONH6CCR814RKC1B1ONO1IOOG===="
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
