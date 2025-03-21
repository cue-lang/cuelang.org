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
									removed:                 "XpC0gbIO/w2cSY2lSw5W9Wsrw4PekfnqS53Cp15fiwo="
									changes:                 "YsWnZ9U2VxfSnpfa015/vC1FAmVSxYnn/x99WkPdqTA="
									"changes: updated file": "kREK6LVrMj67LgM6DMMVfokwH0I1HvLof9UVEhXCT4A="
									"references: broken":    "DAFuuS+u7xscuak2JUXMZ49Ri5YX7w2qGVhzBXfunRE="
									"references: fixed":     "3keiMvTRCg8VeRYDoaDpGTWJDqOCKJuYWCnkYORCSLA="
								}
								multi_step: {
									hash:       "B5JDENR5R73VH3N8J9ET0CJUUUJCO1IR8L2J220HBOFK14D02L0G===="
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
