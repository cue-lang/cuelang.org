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
									removed:                 "NZd26yU8x0Ea7eJmm/byg+230M/lDSnOhHaIW4lz53U="
									changes:                 "2DbdDAfajBNQx6bAC44wAE9xVqNsXfvGFUB/yJSwAXw="
									"changes: updated file": "gmoqT2Fulpr4EjXUyQZVeo3rFx7moUlkYfLnIeGtV9I="
									"references: broken":    "S+bvtu3lhGHXRt08Am9HYCu9vCRTf5oMV4kVdr1yNAk="
									"references: fixed":     "I6xMpa5TPepWSHkI5dJGfjw4/lomCSHUHA6PtUtd62s="
								}
								multi_step: {
									hash:       "VJI9CJF7TSRVGQS8D0DF5NO1BEI30BG5R0J11N14RDCAMIKLV6O0===="
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
