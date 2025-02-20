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
									removed:                 "zOVSx8Gxoa02y9jvzXW/2PXRklbZTsNGVSZg/X+rEBU="
									changes:                 "8pKgG4LPuShtu/dnVOqI97E6aIbbUAGhdkzAGyGPou8="
									"changes: updated file": "WD5Lx7STh+rALSPGGx/pHKoEU+lbpbz55tEirAh9ii0="
									"references: broken":    "CtZEkmspXTl2MoKCkKGheAoc5CD9UI53lrzDWHuEaVI="
									"references: fixed":     "830T4RgQUoETFJJjoyJpAMLw7RQNmYh+GA+Thu8UELE="
								}
								multi_step: {
									hash:       "FM24EKUVODBEENE8DNBLR6F49MU6H99QGJF6QE8T5KDOV6GLEMVG===="
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
