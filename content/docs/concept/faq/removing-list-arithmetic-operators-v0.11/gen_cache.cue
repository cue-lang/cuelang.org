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
									removed:                 "TiPgtbmSyjJeqgJp0d4Yh9oC2JKfuqLfgAVfhZJZXOo="
									changes:                 "bzkTAQ23YxgxgcJ7fyLCmarkppgw15OZoOgUaSboip8="
									"changes: updated file": "vn8LCOg+TkNxddcZp6pMZaHvEk+0V/huadn63MfHKIg="
									"references: broken":    "Y/tukXv9tDP7dYWE548DnwrFCcrsjar/N8pnmh1/Um4="
									"references: fixed":     "JFnAjouGmNC97xS1kqJ8ULmJdQOFkKCOKCX2kS/3dh8="
								}
								multi_step: {
									hash:       "SV9HPS4B27TGC6H5TRA0JUQ078OIL48N8MVBUNGHRD1Q1QUEQJ3G===="
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
