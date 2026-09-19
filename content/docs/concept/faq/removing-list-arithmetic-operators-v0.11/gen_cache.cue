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
									removed:                 "umzGE1gsMf9H1aLKjSQi5Au547eNBNyR7rQZMDKFQps="
									changes:                 "UKqGCXuoLZ6+GaA5yl7XemWNUfMVnpm3KkZz/+pFpt0="
									"changes: updated file": "zwbNO25ylg8DFxnDFqz+XfXVKY3gMHR8w3Jiz9/qaIw="
									"references: broken":    "wTpDY/F2OOAo7XVQLf3RyFHQgzYVMErZl1Uir3fr4Ds="
									"references: fixed":     "TeIkMpQuDNOE5DybG/D5Xrv+ohxag+BQwrqKQoZ5RYw="
								}
								multi_step: {
									hash:       "ROJB97KT59KDSDAJ0KROL9L90THS3GSPKVK4KBQF5DDOTDC6RT4G===="
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
