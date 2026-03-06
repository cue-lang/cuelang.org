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
									removed:                 "i/kTGZFeid3JHAgOVAtx1ggIrl0bG2HZx57gxeY9yJs="
									changes:                 "NllCaWtBM9tBbACfikpkQyhWd33OyQn4VXpvqvMBsow="
									"changes: updated file": "3YVLSE/38r7Tgu7LF/dSXWg3d37pi/1OPBKGEfDqOTg="
									"references: broken":    "stN0maRwEk3mkIu8ULIjxEm/grfG4HjmYrblkFosCGA="
									"references: fixed":     "Xgr02xhEiyowci5FZ50Me7YG9YVAnSuDflTurzPNHa4="
								}
								multi_step: {
									hash:       "D4PF4A6GGP44D0QB0CT8HQ9UHSFC7EU30P8TA1E8NUAOLE0A6HNG===="
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
