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
									removed:                 "AwayA7VLc3x0NQcwBbR3N/yDN1yvjxuza1RFHIcLMUk="
									changes:                 "MH/SZIUjv6iZDLSjHUl8Zvd70zxzQqbWhY/fQ+9ToMU="
									"changes: updated file": "5q54mdOHvC3CAIG+E9+5kcgd+wGt8hC0hb/qkNy5nyU="
									"references: broken":    "N/P9ND8qDAs3l3oRhN5A/uB3LWdm3aqbZT7WbyHMtzA="
									"references: fixed":     "Jc1LNieKdChmGO2APi80Fz+2pNedU2krGuTpue+kOIw="
								}
								multi_step: {
									hash:       "5TUNJP25KTISKAO772E7L7TR8J4RIVTOOKGQUUDD3UUGIE0ONOE0===="
									scriptHash: "SG968CL2ID2LKMV9L2G9187V5QJAHTMHFHA80T860N0LRTOHIJDG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.1:$PATH"
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
