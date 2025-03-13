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
									removed:                 "umaTJr8cbkzRiUIwCk4zYBR09CtWX6OT+X8ihCWKseg="
									changes:                 "qiS//dbTeDLXPrd5r52mdpjKBb9rPqMl7YXMeLXACsA="
									"changes: updated file": "q6K5uX5SeSczIIR4GuflZJiIZRf6WWGXE3+PpxmAMIM="
									"references: broken":    "Q0ne9Iw127u6RMUIpLkdKC4NC9qHGMhgDiAa2EYGYWA="
									"references: fixed":     "yRjzGqkt3lrQvAhPfKL/iqrHN3OReE7elED2g/KNV/8="
								}
								multi_step: {
									hash:       "V8M03N5LVDR3L16RSMER5ONIVAGASG6MVNE8TF1VQQ8RIOLM941G===="
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
