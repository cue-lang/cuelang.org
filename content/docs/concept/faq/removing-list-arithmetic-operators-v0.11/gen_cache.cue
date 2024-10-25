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
									removed:                 "R2jEdiCmaRrKhgyisweRyd1PI47zONm5I96nJmTWsTg="
									changes:                 "GgA7DnFpg1cwM0B8Io6AsSdtOsJ4Ta6LEshZYVUNB1c="
									"changes: updated file": "/pSAK11/hCODxdK9o3oO4jWkk3G5W2SqCGLvmufJ1mw="
									"references: broken":    "gSFZxg/MHSCf0v9A+Q/pz7dJJeB+evfZS1ZnPSjMkic="
									"references: fixed":     "cFuxipNM0kmyuAjIg2ybuaMwBHkN0SDzeT/UbLkAFco="
								}
								multi_step: {
									hash:       "GK464FDIEUME5IJB8GD3N41LNQ19GISD7U1PUDVGM2LKDJM4CMD0===="
									scriptHash: "NGCRI8RKHPCF36EPH1A6M5DDJ4R1DBVII5KTH91E8SMG5MHHFN30===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.4:$PATH"
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
