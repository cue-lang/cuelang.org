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
									removed:                 "W+bg4EXJ8XX1Fyo+dys5p22e0HUV67mVWCvpRvfncy0="
									changes:                 "w2890CGQdowWp3wGKEjGy2pFFzDNtEem+msTXTbSawI="
									"changes: updated file": "3/Bz//e46mk2FgL6s8mh1iaglseBXKZ/AOGhAT6HScE="
									"references: broken":    "ub6wn2eTGCOo0DyKiRX7o8WMg1YMIxryR5I3gLjP0TI="
									"references: fixed":     "r5p2iXVE2Ag1mSsEq2OdcUpuTpf3duQR7mSuyHLzKPA="
								}
								multi_step: {
									hash:       "GBEDJFDM0P77SAE50UGJBI8MH9A467GML5U9LLAQHR35A0OJQT5G===="
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
