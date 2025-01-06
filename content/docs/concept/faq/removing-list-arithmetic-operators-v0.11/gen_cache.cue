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
									removed:                 "stzSgL+wW+3e8J3xsbf+etr+CHjrtDXP+2YupB/FnO0="
									changes:                 "doJF0m+fVReVg5h4d3d1qRN535ZtfCnkoXqmnWYUyi4="
									"changes: updated file": "IwlosKj3sbbjhgvumJPB33aseANksdti74SaIzvcW9o="
									"references: broken":    "6SuelkVqPsj/AKarkb+OHDJO6HsGyhuAqps7LU80bk4="
									"references: fixed":     "FFVxkWFv/D9Wvd6vZgG6W4EAKV8q4QDI3DgzOzwIarA="
								}
								multi_step: {
									hash:       "5GEMTI9JHCLNCNJCHT690DFGPGRTD8LD0RO179I9FRE84HOT24PG===="
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
