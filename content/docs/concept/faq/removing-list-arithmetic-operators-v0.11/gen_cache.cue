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
									removed:                 "RmD4qXBVSaH7OZA53sp7tu2M9gDj3BeEkRGvnlbCu5Y="
									changes:                 "ij93KrK61Y/+Xl8JOfvHtgDOcGmrbb1Mqj8lN22st+A="
									"changes: updated file": "/Hd2MvjyqbabaDtTJqdsXyJBnWOQF12+OxyX6PN0JfI="
									"references: broken":    "gLCqSiu8fTl3zl0wl3XYqdTjKulZ7ClSAH4Y6sGBLgE="
									"references: fixed":     "5/VmPrTUYIfs+mKchxBYiMqVYpojd2h03KznpQPFG24="
								}
								multi_step: {
									hash:       "I6GHK81SMOUDVGINT8V8HVU5MHDVN4JS3PJ4TQV6NDEUOH72VG0G===="
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
