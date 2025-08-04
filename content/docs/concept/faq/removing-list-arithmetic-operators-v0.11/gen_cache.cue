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
									removed:                 "tywdOovHXyaGb0gec1o0kxlli/PyhGeUSbgT+8cVYQI="
									changes:                 "rMU1kvCpI1GG1I5u9ZccRo/wqGj00O9d/7Z3Id4/VAY="
									"changes: updated file": "p5nswAtghYnQbiJxxpd5q/Py3S9VUacMlCWeA5wTGS4="
									"references: broken":    "YSzIltrqF5u4T0jsByO9C5JMWjYd1GBPqFxMroccTj8="
									"references: fixed":     "Y1Fxd/0Dk9C/y8z/2GXReFN5KqJ81eN3oX4ANYjL3pA="
								}
								multi_step: {
									hash:       "T26H61PF4FA4N64PBAI0G5R06KODM839P8RLVA3L9UCC1N9MV810===="
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
