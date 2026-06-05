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
									removed:                 "jPvTrLfNNbjhR9f4DhLBy+A6g/+XPdsGBP/Sfku5r9E="
									changes:                 "KEYsvvpmI/ogOzKPHPqNayuk16ySFPQHGoGrxsGMBQM="
									"changes: updated file": "joPOaJw2ZvjRY05mP0wIEfpx/uolyRGJ0umcYN9oy7M="
									"references: broken":    "qhpMQTbVL5JhagfcJMkXTCGMUTvKlgdzddiSfdmkx/o="
									"references: fixed":     "/OO8PANqQksqGU68sZAimu41FPMwjK6A0YvLR9yCkYU="
								}
								multi_step: {
									hash:       "H6VKDV5DLR6KB04MKHD7ACVTH36HBFRH9UBIUCB048PFHTJCUH20===="
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
