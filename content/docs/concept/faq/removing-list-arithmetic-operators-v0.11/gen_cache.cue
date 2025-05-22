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
									removed:                 "uE0BE5TgbeSVmVUQc0Wgrtp53zJKnP80YLCiMxF6l/Q="
									changes:                 "rYhRDahXPPAm4tKRP1HetJSrkwDjlFAC7LFeaTYUGKk="
									"changes: updated file": "MoT945HC2Uf+KcBarbXOwb9NjDlY4PHdAyc35b8FRIo="
									"references: broken":    "Lozzoi1qyTGLLfSngdKqAZxGEDwamSnfUik7dyg911k="
									"references: fixed":     "KwBmZyALQhFMI3Vj/rE8gi4SRZD0WsTQC3+Pzk+4/zk="
								}
								multi_step: {
									hash:       "KQ9D89LJVUVKAFE1Q6E4C6VB9C2AAH5ISTA4O8HDA3M8QJDBH8BG===="
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
