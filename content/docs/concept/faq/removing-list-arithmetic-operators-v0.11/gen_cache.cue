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
									removed:                 "ZrYNh0aXMmTn5yX+27Kyd9rBh5Q/FP1/OsZB1+YwndU="
									changes:                 "DQwz/GXKFZNswBJqhsWgwA7XLbKLq9NMtZqivktazYE="
									"changes: updated file": "byZqfYmj37XFAvrSv3qXpF+JhUm8vRy2ycsIIUAlONc="
									"references: broken":    "KrG7zQyCMalImCNHA9LiVYOiRb6Qn2GgxZRt5juhMOA="
									"references: fixed":     "rgsOJByXSen1JSW67YKQTDKEhsM0H5oYzE+iYX2gK1A="
								}
								multi_step: {
									hash:       "R46R7IN0R0R0SV3QMUC4MJ4G95C15LNPTPTM1VHRCCTMVDES33DG===="
									scriptHash: "BFJRNTKGBNJD4CC4J0LQRPNHHIU24FAVCCJMB3DKELBVIUBH6QP0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-0.dev.0.20240904084811-bb24c7ce1f04:$PATH"
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
