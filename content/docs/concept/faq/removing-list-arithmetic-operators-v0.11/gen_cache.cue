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
									removed:                 "HnlINqJZah4kCtI1cSgcfBvr+a5B7jYPdRsji/lmkgU="
									changes:                 "RQvg+ZN+OQG+F4gVYCuYoyR8je5WbC+oL+gWig3dRZg="
									"changes: updated file": "Qi8xpOfpRSCNFz3BoRllF6jP8c8PvfYu51MSUceFKm4="
									"references: broken":    "P1gJVPnbd4hyWHq3QQeyUI/oCg42Mw5Qergcek+Zkuk="
									"references: fixed":     "DhMY1LDRaF7/T+7TyrrECAV9dvLeMunTz7zTEOrlSiY="
								}
								multi_step: {
									hash:       "11Q7505ENA7NUR4TNJ8J3O379GBTFSS2AFIMUAQ5IVT1KN13QSUG===="
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
