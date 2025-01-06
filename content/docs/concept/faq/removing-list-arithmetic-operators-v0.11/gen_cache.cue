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
									removed:                 "4QpmsRSqThlWGXVCitQqjjigCz67r3Bk8EdJqru6g2Y="
									changes:                 "tEuNYNpe7q4ByrBKpbgrHwh/Fx5efMXoCF6dMictVPU="
									"changes: updated file": "ZN4lycyzi6rH9wLJcR9irtLZLfH0UlIZeoYQ3lEx578="
									"references: broken":    "IhpJpHwDlOCkZpkhdSZKvcP2Nf2gypo8TU2SyIzVacU="
									"references: fixed":     "/DTXEcNGtzbzzt+LZGj9j2ewnOeco1nsuPv4dMzJMrY="
								}
								multi_step: {
									hash:       "9UDSBST82HQ2F198DPUTKBJRU2MM2FGQL1V72051G4DF6P871AGG===="
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
