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
									removed:                 "u1vNTRY4VgZPl11smQ+K/RXBQDE93hda1bYzF5U9PEE="
									changes:                 "Uwn/6SuckpT7WJtOQvcVkO1sY5u3a2dDAkGXK2ECvus="
									"changes: updated file": "/Q2G5UILLWW64rO8SKy/LYFhMkBzG+2eyn5tg9hhLUk="
									"references: broken":    "OBzzdAGZA9N7Zk0yxtc6UMaVsu40NdLhFTWjyAX9ICQ="
									"references: fixed":     "2CznYIDzBzOd9nvrMnh2xXIm0kbC0Yz7ZOoic5CGSuE="
								}
								multi_step: {
									hash:       "4F74ANNT7S8H4HIA3UAHFB6CS7F71RT12OG32V5OKG1HG3IMTC70===="
									scriptHash: "CVMOA3EDA3632MKT5F679UC4I4EKHPJUVC9HUVMQTI7T8GV8E650===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0:$PATH"
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
