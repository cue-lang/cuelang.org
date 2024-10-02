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
									removed:                 "oW6L2MSZK2rysdB4HG4YsGN+EXf/nVfK5UxJ1mSO+Qc="
									changes:                 "KYr2rIIWjsLAJDbKzVAlSYZvEpqOgzgzyAWSnGNDPVo="
									"changes: updated file": "hVHaV+fR8xwEYmaSVMjdZW7tYL0lfqoZFGww2nDF/VM="
									"references: broken":    "6RdImHSyxkaN2fXxIE8kyzPvO8w8nl1OaYbHYOPQwP4="
									"references: fixed":     "m9FbeOKpEwL6+mId5lYNooQStC5tYUE45rv6/TwfC8w="
								}
								multi_step: {
									hash:       "DV84D9DM816GI7FI4IPV0NHJ4LDRIAEU4VJ4HRASLJCO479JU1UG===="
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
