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
									removed:                 "eRSX/NWN2vPL/UfnADVNrd0ApQBBI3nsciFRwN5TPI4="
									changes:                 "Lv6K4qv2sVQLLp1wdAIqLyR53eD9VNmtr2ak9a+icjo="
									"changes: updated file": "qh+sQNXuYF5/yluybRF0NAGdBFKBw5heIPA10I5Sbuo="
									"references: broken":    "v839jmngAuDxVWIlh7cJhKDy1o9UjqLyjcs/wW2DwFo="
									"references: fixed":     "bOHWq0DkHSPdHUrorLkohwslwGN/MaBeIG4Wad0VNRs="
								}
								multi_step: {
									hash:       "RNMH8RCV1KKRLJT3M6VEAV7OEGHEP2QG34LJ7TGN5TFFJP68EE90===="
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
