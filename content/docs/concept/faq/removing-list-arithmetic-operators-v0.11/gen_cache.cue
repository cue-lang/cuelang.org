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
									removed:                 "7A03X31HJXv1eW1bIMbxfqYG4yGK9gRDYAnO1G07dJE="
									changes:                 "uQUnr0FRg16TIRXfG0RnnW9CeW2IoiZOfN9EKZ8e8HA="
									"changes: updated file": "YoDwCEC2LmwqxS+cuRVi7DvFuHZz98RaSEAqAihsYUM="
									"references: broken":    "cOB7ttw9GERYTO3eb6+pHE6qb74pW6kD0Lc5DKBmbRU="
									"references: fixed":     "BQuglAV7Vbn86+N13CsOm8JjY7i3gBdwexJrsfSTXHs="
								}
								multi_step: {
									hash:       "H0AURVEM15O1VDGEAN58QMQ0508DMP64O8M2QV1QKQ36OEPHQAO0===="
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
