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
									removed:                 "SXiyNgbZF3KJGzDFN05/2MlHhIbTFOh++bKJvdAH0lM="
									changes:                 "9O1yvR1cLO+ylw29SZJdEW93PkE3T+VumFAm4GLbAuI="
									"changes: updated file": "IuEkeLhy7SgfJATpPx2f/yZ6HKP0YUo/KoukjebbLNk="
									"references: broken":    "rF+6QxXDiV2wvdnxkeA09lwh1JrJroENpRaE/m8+Xlk="
									"references: fixed":     "4t5RyuOUa7oJgKSqoQ92snPgkegYPrBvTTyPJ4WyIlY="
								}
								multi_step: {
									hash:       "NUAVU283G0KQAVOU9OLV6K0TAKI5P930HS9L3D9BBLB764SJP8KG===="
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
