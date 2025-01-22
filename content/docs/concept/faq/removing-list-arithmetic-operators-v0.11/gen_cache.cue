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
									removed:                 "Sbx47WFDU6ZKm1oDDND1chlTVhGfQncfhgPqm0hyEpE="
									changes:                 "4nNCq7fIqSzYGWXP83U4CBufzutHVOy8kMEQYP7AOKE="
									"changes: updated file": "lUjyYtjA0146qiHr1K7pcw2sTkvOuC9jRMcMWOiVmqk="
									"references: broken":    "2eGt1uuUMTowYDZW9Ob/RJVNCta47h0AFcUbvqkdfjw="
									"references: fixed":     "1RuLgyLhFGddOlrM8hDxKitksdkuSLdRU5BPbh9kcyE="
								}
								multi_step: {
									hash:       "R7T57QFQ8EOUVHKEO6PEJA8SCGM6LLVJSRFGNOOQHGIBJQ75G5NG===="
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
