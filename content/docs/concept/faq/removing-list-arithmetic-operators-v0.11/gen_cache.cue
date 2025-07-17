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
									removed:                 "bK0ci5Ebvp8SVASs94Txbg8tIjppTBorqdC9WImQHbU="
									changes:                 "wNvJHjQXlWjU9/Eescqco06rBSrOl9Cl+Lkm9uLa35U="
									"changes: updated file": "3lcry2fjy4VcOP51NBo7VizqRxMHfIGutGxkegw+vyM="
									"references: broken":    "MKywRduEyND6gaqgG4KoEGjvoKe6jSHmq3vkmU/enrI="
									"references: fixed":     "7rUAdxXiRDgVRy7uBKXtiWr3SIeiFqrHT4FOYfpzzMM="
								}
								multi_step: {
									hash:       "VFPOGCN55JBV1IGQ3BG0MBJF7IDEQ7AB4QPPKRLMGV4VRHSDVIMG===="
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
