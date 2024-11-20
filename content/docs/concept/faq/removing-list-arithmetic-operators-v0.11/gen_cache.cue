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
									removed:                 "7Dszr0kR1aOqtgO4QR3sgz7OkZ3a4TrrECBuzBtIbqI="
									changes:                 "LIAxs021oIz20p1SB9zvCdJ7whnMNQEqmc6rH/Zk2js="
									"changes: updated file": "i7+btUPSq/kMK4W9h5tsryt2GzPa3DghIaAS2T9sT5w="
									"references: broken":    "Dfhw8dT/LH9gnx8x5lYE2Cni8bisGNynk+SpYmiCy9Q="
									"references: fixed":     "OugNEXvSSMvcvlxsj9ZIdYAYy+N6fsVsrFP7vRW/tfA="
								}
								multi_step: {
									hash:       "A7LSRUC3ETCJL5JVVNQI5D8UCRD7EAP9Q3C4S0VSO5C5DN4QGPJ0===="
									scriptHash: "CVMOA3EDA3632MKT5F679UC4I4EKHPJUVC9HUVMQTI7T8GV8E650===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
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
										cmd:      "mv changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet references.cue"
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
