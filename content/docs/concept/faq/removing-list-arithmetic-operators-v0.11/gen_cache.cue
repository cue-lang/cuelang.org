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
									removed:                 "OCfLBlHNwblbEo52amDi+L3FTwuycc+XAtzHh0tsB/w="
									changes:                 "BaJ1Rtf0VPm+2rPaqlzVHcX3z1K7GGun/pRAx42022s="
									"changes: updated file": "JzABGw/cIi6q3ExrrU9ZDGtBDJw15iUVSxbJasGRimg="
									"references: broken":    "JfhsB3de+k4jftx1013t+nm7ajNXngn6w8V6XH8hyII="
									"references: fixed":     "Cc7Xv4H9zxO8OVWc/RBlh0nkoOHNDu5oD/t2VY2LA9E="
								}
								multi_step: {
									hash:       "ETKCIO8O6QJDHQFFVN03I32M15UPKV5593TUUF6PP2DFQSBRRTGG===="
									scriptHash: "CQLN0JB91J0J500G73ET7JLAEUQ73QC37IB3PEFB4O462O83DV2G===="
									steps: [{
										doc:      ""
										cmd:      "cue vet -c list-arithmetic.cue"
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
										cmd:      "cue vet -c references.cue"
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
