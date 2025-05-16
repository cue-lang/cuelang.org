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
									removed:                 "nruakgvvNayoue3BkwyvtJ8zzGo2RDW8O2q9CwxtsEk="
									changes:                 "5cK1I3CkQj7Qx/Q0GzOYFmEbCxCNrlZiGPoAoHazhpM="
									"changes: updated file": "3gpS9bv3bJg3+eBAeYml1VqR6DT4Vg7WDh082oAtLTM="
									"references: broken":    "HfuXgy7M+ElnrUk1aRUfImZZ4n8e/Lm32H+vFytEIG4="
									"references: fixed":     "RzXcuda+JSsQm8ZCEkLsENY3SJn68KArb/IK/PyQatU="
								}
								multi_step: {
									hash:       "NAVKNL7S0NJ35R6URKGS8ISE9P3BHU3P44J9RBEJL518T5M794J0===="
									scriptHash: "CQLN0JB91J0J500G73ET7JLAEUQ73QC37IB3PEFB4O462O83DV2G===="
									steps: [{
										doc:      ""
										cmd:      "cue vet -c list-arithmetic.cue"
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
										cmd:      "cue vet -c references.cue"
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
