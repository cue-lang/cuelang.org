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
									removed:                 "vPOHKD2lVpm2sSRVwWNjJApBM2u6aoXZ4KfhYrVQ30c="
									changes:                 "cl28dV24jvi1bAJxZEg+nfJMBc+Unm32PRNJPrlTBrA="
									"changes: updated file": "72DtwAGqNijtj4Lr10gid63ILfM8bLlkGh5Xxd5bnxI="
									"references: broken":    "K38zwcEX4Gb58qQEn5e89G3zTfC4rR0hodq1nKKTpRw="
									"references: fixed":     "jErwy1OisxhijEWu1erpVZ2UQYQU6K8TsX9hPhJCQ/Q="
								}
								multi_step: {
									hash:       "8IV0681A0S9BG8Q2KAGF11I3JF9DKUAP4DK6AB6018NFR2N4B140===="
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
