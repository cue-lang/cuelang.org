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
									removed:                 "sXIGof2h1ngzFuA9NKxs1cm12YVxKg4pDzMocSIJjtM="
									changes:                 "fIYr7qj/aaA56Mob7ycZs9crZAPEG+D8Wxo1Dft5/jg="
									"changes: updated file": "wf119boTSwiRv473erXvHmQDXQNIoegWwbbthShDjLI="
									"references: broken":    "CGhskkZ1IKb5GdEZeU3/dQnkH0l7kwoWKTRa4dPtYHU="
									"references: fixed":     "U+EiA9juUg0Jy1O5tzVrmkKuqxBknZxom6P1c8OnC1k="
								}
								multi_step: {
									hash:       "MONK1H749FF1R7USKOHRS8O3KL0T3KPP32QSQTLTN11D72G8PUM0===="
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
