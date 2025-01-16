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
									removed:                 "PWuTN7wCMGkul/laweGwXiXmm8ue/u2F2H0Q+jWAPgM="
									changes:                 "pdRMfZZWYJSsDGdIdEiHz2dRtEDobZLo+qlGH1lH8t0="
									"changes: updated file": "j3bWjMzHwZT1eKGjAnochroN9WAoNSMlMuZgoY9BVr0="
									"references: broken":    "hzmwwvW8oXMWzdrtSUtE3TSategRVB02CsOpnhRf9QM="
									"references: fixed":     "hxzDNSNKHOhdmLAfF6W8X1+9iiB9nopxyeaXHhnw2Qg="
								}
								multi_step: {
									hash:       "QPHAHBURJJUVLINON9ER2P4UP9I6R2B71D7THPAL8EI46V1N0U1G===="
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
