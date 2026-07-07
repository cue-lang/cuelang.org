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
									removed:                 "DuaMr2JWVf3xeDKOgx2GJvHDjLqzshjhIIFEQSwHxf8="
									changes:                 "eWnsZCm3r7JY8MFeNImKXVAif7RzflTEWXUvd5uVa+0="
									"changes: updated file": "Y1oEmffNq/BYn1mbe4SwmPipN06m3be3aX09I+89slI="
									"references: broken":    "34dtC5DNmMDxhOC++gsNW689FIBEw09wVoqr8MWQG6w="
									"references: fixed":     "NtjE952ChxvBtL79fQnLvkAAlPyyKp/pnRWe8BC9koI="
								}
								multi_step: {
									hash:       "6I4JB736231CKR28ICJDAEFHT4POPDJMB5M41P7CL55HL981LPG0===="
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
