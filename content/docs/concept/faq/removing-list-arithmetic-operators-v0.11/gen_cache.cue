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
									removed:                 "Scy9+GkBxKoQwFYChG6xxpcWRpSnuoyfIVHlJCzTVxo="
									changes:                 "fgi+Wk3UVN3Z+1WpzKdL0pqHj+cPeOIiUv8GoWY8ZQU="
									"changes: updated file": "q55/1x32+xDWF/ZEdf9++jXbWx7MuUTQhu87ucjONjA="
									"references: broken":    "tssAtE0Qq0BDeETLlHUqyaNIGyXG9OIp36vGSMjVgao="
									"references: fixed":     "sU6TrxlfqiRmRz4cOJhHiJD/sIXKwFsoXSQ0wbgh7X0="
								}
								multi_step: {
									hash:       "3VM235INVJO1E7J6AI16O35KT9CFJMOO26U0CCO49OB9TVSGEL5G===="
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
