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
									removed:                 "lfWMqx5z4vNohxYhRt2Vavjt43YV8FfLM6L9u45rAZQ="
									changes:                 "esneMsGyYA8E44jB4sTLWNd4KNQDLVt5BBmkau3K0S8="
									"changes: updated file": "nxpBRRbE7ia7oEnmK+t/+VX34nIDvh3DbDNcTamg5jM="
									"references: broken":    "JkfxlBQbOIlzX3DiJk6D3JGwmvDD832vlzUlAvaGxwk="
									"references: fixed":     "946aMB0Rf0nBEXZZU++PQW7vKCPZ1HTjuwZU+e501uU="
								}
								multi_step: {
									hash:       "5I7KTIHM0S7DUB9DB97EUISEE2P8M3B9KE8RMV0QNUK9NI699AP0===="
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
