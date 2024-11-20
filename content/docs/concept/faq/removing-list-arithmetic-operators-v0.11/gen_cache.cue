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
									removed:                 "51YrM4Y2MxUIoNfKiGOsmuZfOvl3iN+ysSxbgVJ7Xo8="
									changes:                 "fPrqKqlRwESY/Vpj5+qNQ1STnvjxntF1VjizM7RFXAo="
									"changes: updated file": "qLtrKC5wYhQxm7Nn3/0cyNvhjwlExt4i8fn3S2x0B+o="
									"references: broken":    "B/4XCp8Nzj2sP4I1k7RF9CXkL5EesqTSMUxSRp/nTmA="
									"references: fixed":     "y2/W7mtaOgs3w43Tbg4KqtyEeBti8x+xHX262RO8zTY="
								}
								multi_step: {
									hash:       "VUH3SF5O8PO2S1JJLOLGCROQ7AJHR867Q3TNP4QR3T4T6UTR82C0===="
									scriptHash: "CVMOA3EDA3632MKT5F679UC4I4EKHPJUVC9HUVMQTI7T8GV8E650===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0:$PATH"
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
