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
									removed:                 "vtQnKplfcLMvHarbYIX0cEaBZo6RgooEy/5sUFTjY54="
									changes:                 "h8cfxt7SM0Z/aJ500L1yXxxpb3DRMh4AXYVYWiL+BUo="
									"changes: updated file": "CRIJxqWfs91wkiDkjhwSTYhbVH8CKgx9LIbz3Znfjso="
									"references: broken":    "PM7hSaMc5I2U6//xXqa6HMSoTdVGFDW8fh5P7vZ/WYw="
									"references: fixed":     "3s2squ9ETtIRra9YdK2gFSzETWkexzBiQRM/tJkW6x4="
								}
								multi_step: {
									hash:       "113PKPF5JBUUKE7J14ES2A84OJ96CVUD5LJR83NP8AC08LERDC2G===="
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
