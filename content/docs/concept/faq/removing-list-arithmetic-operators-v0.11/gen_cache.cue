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
									removed:                 "hTWN1DXTTAmqhXP2DhzWcoUzaSlboUd7+lEoquWcO34="
									changes:                 "Gmm7UaNrpyWriFmoTgevvauwxC5UJFOy3YSzWdu30H4="
									"changes: updated file": "0d2D1xxO4nv3RX5EG4Gm8Mv5jKABUg3F+XNZxOnheRQ="
									"references: broken":    "19agr8RNHqYdr5XqjTT9nUOeLO4HL5og8O36JvgmjCY="
									"references: fixed":     "1WWXQpB3vp0JiUft+iCWJbsPn/wvTqR28yOnr/5DKsk="
								}
								multi_step: {
									hash:       "3CJMIRISDPH117K0RT1RIC609RI6TTN77SD12ORF67R3AJI5NRJG===="
									scriptHash: "JCTC3KUK6RTS6D8EIMN75N3QO3EK7IB5IK3UFL1FN1CN6OFQTGDG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.0-alpha.1.0.20241220130530-e4c4b8e8a15f:$PATH"
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
