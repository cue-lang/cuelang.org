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
									removed:                 "2QTzpv/d/G0yaSIBLbw3fr7UT6ZauTgsVVso+IbqffM="
									changes:                 "Fv0To+qC9BlmtHkFFNNbNzw4WGmx2LlzU+Z+QEWyIps="
									"changes: updated file": "gKz5Jex3hO4HOdULzGjN/IL4ZJ7cOU2QhPwBsHnWWEg="
									"references: broken":    "eUp2GkL0dA9vUfMKWkr7kLFCzoLzVkrWMHmaoGTt7zY="
									"references: fixed":     "R3v1HP/Dmz7yACy0/oFePFtJ/9+oSpSBqTk2qtw5Hdo="
								}
								multi_step: {
									hash:       "RRD9F3V30C2GVQ8MV5GGSEMA7G3BO3B82F8HUU682NN39VRV4RV0===="
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
