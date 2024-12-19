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
									removed:                 "HdquGCZiPqNK/+y+NzUmx2jaccF554Wmmt4LUJMnW0k="
									changes:                 "rloE9Lq/QlR3P0sjmN6GrmjQoPVk4K0C2oFsa4Mo6tc="
									"changes: updated file": "Am9OxtqNelBjNrqkYJsIjwljqWd+b9PnF24SsK5Qg9I="
									"references: broken":    "Q9fUao+MtLxXYHN2E1qfZzA3AF1gKUjnLcFA2MlEj6k="
									"references: fixed":     "zmsg6uAc6+1YhggrSlHSUQCQu3INT12SoNvsvp7hDo8="
								}
								multi_step: {
									hash:       "1PR9RQF2Q9SP9IPUKJ2S2UNSGBIK15SABJOJ090OF3QMO8DJ4DN0===="
									scriptHash: "O22KLT8NJFPJHEJVT60O1LLQ1IBCJ9LQ7JIFRJ6U9CHU2I9IRIJG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.0-alpha.1:$PATH"
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
