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
									removed:                 "auogYspOPdbpkE6izo+Crx6H+9mcpjvjGRgLJ3biAEs="
									changes:                 "x4YqQHHtL6UIvY1ZdeF+mfzbX/we8AIhL08PMqVuT5I="
									"changes: updated file": "Lex4+vNaOtVp0G3jryvGsj8OSpyLNhxipSf9PoKKBGo="
									"references: broken":    "nmnD5NMbrG4uSlFWVyVy6Rtv0zZVJS+AP9yMOO6y9Q8="
									"references: fixed":     "1takszOOdZJp4p1aKJ8vbnJtAq0EgyZNtJ5UUA7y474="
								}
								multi_step: {
									hash:       "5LDKBFB1PJI099G09PTCRUO58PBMOPET91UDKQH8C8MNMJGBM2HG===="
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
