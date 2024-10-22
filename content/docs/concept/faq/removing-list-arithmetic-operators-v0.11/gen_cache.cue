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
									removed:                 "0znJj8y+IGh+Dr+gf94C3ZIoDo3U0xLKCTDEOV4nMXI="
									changes:                 "1XZ7s6dhWGfxrDuWhK2KDOT6ENzqjcByus/eHUidRSw="
									"changes: updated file": "TvUg5rBO8X5dBRCxf7/XS2+OAK0sYXz5c/zttmwfGcw="
									"references: broken":    "2vcxyER5299egOvK3/z4thgxoJnbnZTSjSD2VPCg62U="
									"references: fixed":     "9KeTMVu2U7VlOYao0WE8gIuUkfvqjHTCngCW2wEBvzE="
								}
								multi_step: {
									hash:       "VM46H480684QIQ1IFTIB8U7TAU0QNGVP45TQKL62KMRQAV6G01PG===="
									scriptHash: "NK5CEA6CUR4KTFJHDTJ0HLDFL6HC1RNK8VP5I0RNME3JEKM8QR40===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.3:$PATH"
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
