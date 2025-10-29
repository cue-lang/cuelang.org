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
									removed:                 "2NbdDdHu/2rKrppQgmMB9jmbbtqEXaXAbfxiUcCkQSM="
									changes:                 "zxkAWsuu9gafm8umbkPR+qYt2FSDA/mzujD3LwVtMGg="
									"changes: updated file": "ihFHxxQvdb+Zst2p4epUeoYbSA8b+s7B/OhcYVLP4zk="
									"references: broken":    "kKWJ1fhLsK3GY2kBSKmghbCZBHVlMh4ik2FE4kZpsL8="
									"references: fixed":     "M01gsLFCpFcvKwdNm/YFoDbOFCgC2pESIdz0RYTcl2g="
								}
								multi_step: {
									hash:       "KPNA6K8AGUC6ROCAJ1BQMIUB2B33LHV93V4DS34JHAGP652QJB5G===="
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
