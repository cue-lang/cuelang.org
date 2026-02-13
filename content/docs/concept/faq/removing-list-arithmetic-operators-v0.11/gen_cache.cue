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
									removed:                 "NMFXYY2IIrxRL2dYpTdPfPg/2ixe+RWgjQsfG3+D5Fc="
									changes:                 "Rny2Zu2p8GuTiUHqpR1heMdotW2g+6pHy/8pT0BM9C0="
									"changes: updated file": "0QmvskqF25sYMPtR7EWUCMFTUe9EnwATosTn6Om1ZrY="
									"references: broken":    "Gze+ZtaAE0sSWJ1h7wdvh0bb3pv5jCfv5ubeAbBeZsQ="
									"references: fixed":     "CxrBilCl7OMhy/5wZ90WAw9OZJ/sZUHMrFNbRHzzGP8="
								}
								multi_step: {
									hash:       "V820BTUJEUCV69H3QDVTHUV7K775ICQ9QE36QHE79TG2685ATHHG===="
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
