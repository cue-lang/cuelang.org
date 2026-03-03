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
									removed:                 "c+YXMPs9ew8QgJd9gsTZx4saTobrv4z1tFyjF8E/Rhw="
									changes:                 "Mlw4ZhojDUEazMdrc4BiUAooXHvsYf7BK7fnp+pHjmU="
									"changes: updated file": "hFE6CLoqaOoGwbhv2kdSmJiPMYuZW0ntoaOhBphuayc="
									"references: broken":    "G3tb3YszaFRXP4lx5h7ERyBgLjEBukSRHUUxC/qYG48="
									"references: fixed":     "L7vIFdYqls2zB43TBZ/GkHQ3OTRdlD2BtbyrlJbWZ/k="
								}
								multi_step: {
									hash:       "9LPK40N3RU920VUAKMH45U3GV9T9PJS1FAU6UJV1RD94FHG9CF10===="
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
