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
									removed:                 "vvIlCxIRuqrH9pXdJIxLaLO3K/9FX1TOAA+9KXHj+L0="
									changes:                 "sjDSQs8wd/eZmaOauawSSlYZzlGwqTJx0MqVR+YWa5M="
									"changes: updated file": "j/rLCqN8fcUy36eT9B2KV3eq0ULRRVmlDZVONtNiA1w="
									"references: broken":    "i+/12wR1IGkbDJNW6f4ylKp+lf1odEZy9l4I0RS4JUs="
									"references: fixed":     "MvJZIzOeR3aAjQ7Z6wfncpaAvAmMMOOt5Ju6vZHwEVs="
								}
								multi_step: {
									hash:       "U3257MP8NSEH01G3E1ABE471VT8HMJJD8PKP128E59PCSTJV9NQG===="
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
