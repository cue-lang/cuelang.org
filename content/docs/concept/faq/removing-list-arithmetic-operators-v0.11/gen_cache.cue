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
									removed:                 "XwAx8pwPTw+1zMSK9b0pfmvqnDzGJrEzcNimlpE01PE="
									changes:                 "CBNi3+VUi1/lua+xziPbYEJ/WrHqTg9LPqrDpDFlhwA="
									"changes: updated file": "670TsawM7kXhReFHa6xHv6guDAb5jzGBbwtusHH/lgU="
									"references: broken":    "V3CwwHMTEF2q4hoXMqoCNaeYRW8HIaXEeB29qLLx5Y4="
									"references: fixed":     "V3fCDc01U35Gy2MewCYYTupzSRhcvTABoiD9Q1iLz2I="
								}
								multi_step: {
									hash:       "G0T6LVC1QSC61QKE84KDPJKQI336R97D9QTNAQODM5JDCOM88J3G===="
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
