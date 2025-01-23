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
									removed:                 "Q8dkBTVnXQWfi+gPOU76Qp02OC4LeLPZQKtUI22R7MY="
									changes:                 "GZ7dJAhfqJ2saqFy8HlRAtQvDwsNbFShyE+kBQIDorU="
									"changes: updated file": "C4OEjvZi/mmelIoPDhNo1ygfT+8Xd7cO+HWd0d20xCk="
									"references: broken":    "Aim85Dh+5nVSnqBIQRYmne+4r9Bsu/MEF+ik8jmceXQ="
									"references: fixed":     "g0+gK162C+Tcxx4nK54m0QGeJv1vrFzXDhYP+wOsNPo="
								}
								multi_step: {
									hash:       "2I6O2M0ATAOOVRGM12EER0MA1FMKOOBRALO76HPJQVAE3H7S669G===="
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
