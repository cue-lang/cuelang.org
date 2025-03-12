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
									removed:                 "8kTzBPzi2WHQl+SYFLxsnOVMKmroZSz78SOmtOYnMoY="
									changes:                 "fXlJLHOXQjBqGkDlzDCrkynAhPMmk1MGF6NRroH9+Lo="
									"changes: updated file": "tIqrdEmZ1iI5TY8eo1s2DnHvkJ30ubLE5R7APDn60bk="
									"references: broken":    "os9axTWsKya/dLN4/wogCgGYknKRVDSt2P6tTMa04xo="
									"references: fixed":     "x6h9LSCss5/z0Y/LDmw4LFRPiifnKNag5DNpsgrsjow="
								}
								multi_step: {
									hash:       "N0PTM6MVV8EOP46BOIJLT7IGTGSPOIVFOUUIAHO9U77OOJTSVSDG===="
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
