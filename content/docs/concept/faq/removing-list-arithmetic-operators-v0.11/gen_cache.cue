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
									removed:                 "PF7QFBHQWahR98jni9aPDL3KnbP+qiYs3yGR3FRriXg="
									changes:                 "ywLGsFn4/A5VeuBtUZL6yBKek4ByjllarWcxmbpv9KE="
									"changes: updated file": "scORhxFthS+J92MJJ2QSK5ryJwPZIEUYMhwZD4+fIW0="
									"references: broken":    "esri+2+mHSay4Wjl41Yhlkhnr+B78KoIzyhxiT44ops="
									"references: fixed":     "XKdvfrUJAmeHCjqK0FHC8d1nBa8+YZxOVMdhOrHp3NM="
								}
								multi_step: {
									hash:       "RFS39BCFVBCRH0KHDPPEMPC2ANB59GGFGI4I88F42VSFHH5SEU60===="
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
