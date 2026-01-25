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
									removed:                 "BD4/c7SLGSWSWpJw2ZtdR2GiBS7Ipztq+qDwRVXtZ3E="
									changes:                 "bWcuOWih6KhJP7tqJpXy2daZdDTlNXtgy4FiF7nssng="
									"changes: updated file": "VFwq3irekrRpWznSpwgt/ZbTfzqewmEHg0L43IU6hJw="
									"references: broken":    "//IetkdAFj4maUVRSuFjnB+PVyUNvPRkD80YDTJaFFY="
									"references: fixed":     "U8fZVR14h0BGhc5ZEKVw2KsWhNHUqEaaatt8gq8VO5o="
								}
								multi_step: {
									hash:       "FH6CO7HFLN3TI0SAM2HRPLFG6INPFH0G9G15LKIVGSLR5JBHSP50===="
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
