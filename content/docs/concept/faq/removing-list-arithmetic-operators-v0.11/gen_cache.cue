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
									removed:                 "+J8kP/v5U+xmLM22aHeEqGFU+28/KwtMqbaKK23Xhrs="
									changes:                 "D60zGeNbiiT1JaTSMaV7L0Bghn+Mxvqdt1V4IfPkqlc="
									"changes: updated file": "l2YADy2tLoERS7J2WAP2VfGDJyi/y7LlX9ipPSu6NC8="
									"references: broken":    "67uRVWBRiKktZf7Gj301VEGLgQUm4XDBgG6l4uYCDO4="
									"references: fixed":     "jXrsojaeRdoDIr+GhYeka9ioWjUT5D4jgAgNGhmaBx8="
								}
								multi_step: {
									hash:       "NPDODBPT3PPDJEM0V5IO0CM8NQ4FU2HIPILA80JL5AFANTMTVOU0===="
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
