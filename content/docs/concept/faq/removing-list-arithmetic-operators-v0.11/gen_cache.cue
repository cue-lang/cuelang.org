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
									removed:                 "t+5XPj+VPTIoCYMx5J82ecwZcymfar/SQxJfNpjzU6M="
									changes:                 "D+ru+bd/IKknvKz0JL9dRjunMDazm4MB2Hr+NEa++uY="
									"changes: updated file": "h/DxzCW6HpafRgp+ydH2dsHOWEIsytNxOyJTdGMfLoE="
									"references: broken":    "Z65wkCgTvXM/GXY3Z6L03z9ZUICSt2zI5wOo9s/Znl8="
									"references: fixed":     "NlDGmuYg4PrQjqFAmcIZlLbPjJaUNt5fy/p1/K09XXQ="
								}
								multi_step: {
									hash:       "PORNCS85VRUOT4SDJHKTUHJF43C3MCLJV9H6S444VDI3JTM1BUDG===="
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
