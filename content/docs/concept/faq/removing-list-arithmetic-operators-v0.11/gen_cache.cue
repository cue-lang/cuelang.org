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
									removed:                 "eVJpOnH0uaiCLqIWsBT9cqGB+zO3glpNb4kqkDUpJNU="
									changes:                 "rfrQnNHldOkBZlkcnDewAveU96Z+XEufT936+ZgpSC0="
									"changes: updated file": "s92KfaxARw5QQxCQQKsSrjtEA37BCqunyKUXqzkDRvQ="
									"references: broken":    "A7TnjqYAFUCWLblTXpjI5HW4+4MAAfymwRW5PbroZGU="
									"references: fixed":     "3sr+jpF0WXv2M4fMGeipJFfilrm2z/mY71VfIUBHOl8="
								}
								multi_step: {
									hash:       "DQB3C0JJN6FDQPL51N2QTIAJKI4JN3J2ORSEMS4D9BCITGD4L10G===="
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
