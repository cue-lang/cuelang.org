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
									removed:                 "/ptjTkNESpNhnzufsOBqalzFhao5H7MwMGS6He1TnxM="
									changes:                 "PUUSVQuMuqo91lB1JToA1/EL0bmbTIePQe6xNJxYlN4="
									"changes: updated file": "v1w+nYXCaUFX4NSOIaPkMelkaczdV6BQ7Dv7sDaZoD8="
									"references: broken":    "LTA/v8iClV7KkhICA/h/TvxqdwoMGwovk0XPxCuykAk="
									"references: fixed":     "HT7X4T+OMk1GWBO2o+ngFH6HddkApCynH/dAfSVcdIw="
								}
								multi_step: {
									hash:       "1L2E2NGP433GHJSVPD43U5G9LT8JNCF5OV80RV8EA2AAPNGAIKRG===="
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
