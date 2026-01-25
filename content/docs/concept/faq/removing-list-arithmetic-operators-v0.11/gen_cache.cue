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
									removed:                 "m9z8nwv4Gqt6SNfjpMpiG5wmRDs2idIQbyobSFIwmp4="
									changes:                 "tbcJSaZu7cEdC5EGkrHNRWRcuzfcTGX4a0+i1dqWumM="
									"changes: updated file": "Yim4nVOyFcKOYE4Q8pimX/HCLruyYtQ2+sv4WrhBfoI="
									"references: broken":    "N+eUt7HqZyaBHxZxuvzVnm9RI3b6vbM3nyjv/POYXjI="
									"references: fixed":     "uXYoJMzitNeBsBeNf8SObnZUtpmIQLEWMiQAF9Jpbww="
								}
								multi_step: {
									hash:       "TGQMDQL3HBB6ABV1A9CHUOJ373AH9FN393I9IMF2J81TFQQ4T620===="
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
