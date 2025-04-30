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
									removed:                 "KPP12CU5WlTD0vqQNsJZ4Vpoy56VkIQQtrbanY4asp4="
									changes:                 "S8k94opsFl3RrZYvpkyvn9f4N8WGc71DQ56vq8byRfA="
									"changes: updated file": "lEkT8r219u6SDg6sM+GtEYHZRGeRj3rZAyDU0bZf4Lg="
									"references: broken":    "bduHvZ2SijaO7oUEQG3Rp+fj7jrssL9H24RtY2crpVI="
									"references: fixed":     "pw+X+rXir4mlgQEG78WBSXrng02/PBCt0TFb7Lijp9k="
								}
								multi_step: {
									hash:       "F0DIEVK8HBA8M14CNVONCETT9OUV5F0B6P5UB5H796H3L5USVKJG===="
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
