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
									removed:                 "rUJvUFosfnpLyV4/pqGhUe49mhjb9KXW3aQwELlb1QM="
									changes:                 "xMayGpfYOWHQZL0xruhU1peZZMENzYQpQqNOuJ5vyCU="
									"changes: updated file": "wlFXTpSRkc4MAj9zwwh2ZMkNaw//Ebsve/amVqb21dw="
									"references: broken":    "CQgipHcKuSgP3TDMh7JYQXXXnXVQpdbVDn6m2rqfmZ8="
									"references: fixed":     "/VW9QZrQ8ALd6ZjtFmTFoDpfAc3tLbDgTm+qSU4FaT4="
								}
								multi_step: {
									hash:       "BC27NVBQGJVFB20F9JVPA31KFODTDU42A69QG37ARNGCOS2RQ5SG===="
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
