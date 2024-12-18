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
									removed:                 "ZBcHsJ5x218KfoaawsqaXXnJWkbUwELxJd7JY1oBTog="
									changes:                 "xMmCvVfj5k4QoGZViHKF48kmVAnsRZuQn+5mxlIrIjE="
									"changes: updated file": "4kOwrJCZ5P30Kjd61rg1aK2XVqf4cLQvCF+zNmIJP74="
									"references: broken":    "WAp74cBPwngdL3l0osSZAoWTy9fho1NAleeffkzRMIw="
									"references: fixed":     "ANMD8jVgtllIcl5TkeRX52ZtVMy2NJvrXDgqKnYFtHA="
								}
								multi_step: {
									hash:       "OHBBOGI7146J4A1VM7R50MKHI5NT2L2I3340NHVG7OGREG4FEM2G===="
									scriptHash: "QEDLTJ2E8KST9L5POS18B1O3U0FNOSELPUD6RBJHFV68PQ4OF4NG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.0-0.dev.0.20241218161113-f2775f863f4c:$PATH"
										exitCode: 0
										output:   ""
									}, {
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
