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
									removed:                 "/DsgZVm8XpXR5TRByxWG1RBsMQgFz/ykTkC2n6cm5Ic="
									changes:                 "zWJHyz/VadlJ4AZXiySOnDxrS4YZDbx/u8X1ub9XPT0="
									"changes: updated file": "5ISMyfHHbLjd22HQ9M9LFif2EAOcP0KKDEt8LJ5FHOQ="
									"references: broken":    "txCbHzYzB3/XZV9jkvfny1iAlVPyoE884XJQs3QIX00="
									"references: fixed":     "IgHNGh3lZlSfxl0nu75TznNF+muCT8DxkrWb20SuICg="
								}
								multi_step: {
									hash:       "HKCRO1E8C546BFS2A4H1T5NIE073IJMKIKVIRAVTPS7AKGG1UNCG===="
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
