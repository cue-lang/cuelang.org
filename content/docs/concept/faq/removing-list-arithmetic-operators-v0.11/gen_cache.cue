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
									removed:                 "fF+pEljcwW68cnx11n0pmTBpCwojdoEmxlT9al9RCfE="
									changes:                 "jWEoi60PbuwIGXN9Mnqh26yhr/qiZtSGRg6oHKwR1lI="
									"changes: updated file": "w0oN3TbxtC4UFdJEAhvRS00A3QMeSyQ60dicR6ChPi4="
									"references: broken":    "RUCsgIdBw1M50KmTvSit9ACoMDtUGfV4CeKjFc/bFF0="
									"references: fixed":     "6Z7RQ7yhfJzxCNyJqKEQqy5y2c4fHqhZJ7LagJiaw/I="
								}
								multi_step: {
									hash:       "1TCMTO5P6Q38LFHCPEP1KFJ3PE7LRFGE7QAA4T83JAEI45VJ4UK0===="
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
