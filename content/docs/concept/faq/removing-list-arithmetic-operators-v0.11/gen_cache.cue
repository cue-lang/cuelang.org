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
									removed:                 "QirGVfEHno6YQSLNN+YyL2fyvEfGS1SA4MakEBdew0E="
									changes:                 "5cGlKK0Y3WjBxKTSsOpm4gxIwTYCB41GIOU9xs6ERjY="
									"changes: updated file": "YT5gTm23hto5CF5Bi6sPJGoc29GEt7Ht+J/R22tqkd4="
									"references: broken":    "3SYsUj2XTfaARXB3UHr8oZd2+AFM2STqVR2rv66+h4k="
									"references: fixed":     "TY67vFmO0Wq0B1Bm5P4suElnA5aLL+XJs/r2hHOcKsY="
								}
								multi_step: {
									hash:       "QNC94FBTJ19RBF2F3EU3HAASBQ76OKJFVC49HOBMIOMF4E1OCHOG===="
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
