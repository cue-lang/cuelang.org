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
									removed:                 "xn03aVZaExZetZsLGvM0BG7pYwwZPosdWuvhMDsrNK4="
									changes:                 "uKKNFPJQAdV1GMDsb+mrcCmGXAULW2sK0bedFj5J0RQ="
									"changes: updated file": "4BExEV2FxUMq88TXf+is78yGJ+HIlD4KI5kxqgtjrmM="
									"references: broken":    "rk0DQIIcp5OCIVIfsDkrBQ/+oSVQLO4mj7vchCo9yQg="
									"references: fixed":     "5D7P6xCIBAfsCDKSyyTMyeQLFN8aCghnNeCwGJnvmP4="
								}
								multi_step: {
									hash:       "G8RMAJJ3G508UVDSAK5DVRPUTJK9NE0GIM3KB1UKGKQK11MPMQH0===="
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
