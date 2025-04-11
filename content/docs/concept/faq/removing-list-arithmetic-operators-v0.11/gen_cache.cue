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
									removed:                 "hkV0WXmJlKK8E+rl0nxwQflRkk1Q+5kuEjSInly7/HE="
									changes:                 "6xs4RZDL3J7ipu/x2lhS2kdKrrwTa+Zha+nw40pmgic="
									"changes: updated file": "+j1mm1nmihDUGPP4TxOo8LJHWW9W+WWSPDM8BM2Pm+o="
									"references: broken":    "upwsB/N1ee0Vtp6bJGlsH1MDMr5ab9wUJvphdVqqMSs="
									"references: fixed":     "k2tIDf4Dx77B9g6iJZ0WXw3qmZlo+xnsK6JaHE2OZt0="
								}
								multi_step: {
									hash:       "QFK538NRVVS0ATEL7LUC6OMQU04AVRS0TRD8PPBQTUH54I0CK1NG===="
									scriptHash: "SBEFDKT04I04B6RCD2P46K2LSE31D1LS9EPISLM626C7D6BAQG20===="
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
