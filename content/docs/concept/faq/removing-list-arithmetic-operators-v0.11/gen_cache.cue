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
									removed:                 "KWovmwB0ANu9GyDPQKIsWul9KIdlUhzzGCDAaJdijgw="
									changes:                 "NnhrJ5ZtoDiEtL8w3VOljpTXvH5J7wFfDWods63NHMY="
									"changes: updated file": "mxvOqvSP/K/lMXzNgLIxFkWCfS8d7WDQFgtw5X5hVhY="
									"references: broken":    "92BAumjgMznZ8J5pCXWPmZAo8fD8mrlPJxBVEh7ntAY="
									"references: fixed":     "VVJF9A7W9+G5MloK07Le7RfPWpNJB6MIk4bMPx9ZRH8="
								}
								multi_step: {
									hash:       "C8HJ6VS5T9CGREBKD7NKF7Q457P5G1QG0J8E4TF3QS61FNL39T50===="
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
