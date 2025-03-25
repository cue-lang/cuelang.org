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
									removed:                 "VzccjKN1Ns1ChbTB1zY/hf9StiKmHQ524CGVhJPsLwc="
									changes:                 "OLMjRp8P/t/2RkczTUa8usaBJX4M/HeXPb86P3gIiyE="
									"changes: updated file": "kVJZa9fZ5JE/5ZLRb5Bo7zZU9EHwF4/lVuW9h58otFQ="
									"references: broken":    "sXeQcxzEq9kUOHmiU85Qjqsg9EpkJdzxPEhNTtMUx+4="
									"references: fixed":     "1jdxVTqfU5jAVtG1uRoBnaRKPCtfrMaN1GAjUTAtci0="
								}
								multi_step: {
									hash:       "3HV631PR25LE09AL9R5P2MOB1V96D1VRLROPFFN123PJKORJ7RUG===="
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
