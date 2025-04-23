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
									removed:                 "p+w4PC7CEcqYuG5tYag3/en/smzCY6UartBecU/lrHE="
									changes:                 "Rl7mhZG2OGbQkkOCwcB7JUHrgIMqSXIHwiWSBhmEqPE="
									"changes: updated file": "GQCRuFbPFpq5FZ6Q7iODAVOVJKjgEqeEhsOe1C8HdnY="
									"references: broken":    "uxASkyGwiNv0kgVJ+2IA6FO4WppOpYdP4pYoxMfvJxs="
									"references: fixed":     "/XvUFW1m7ZxiLTaFlcGJzyOMkrTPX6mgb6atI9uvGLU="
								}
								multi_step: {
									hash:       "IO2MEO2Q34DUOTEGSTNVGM3FMF2JIB7BASO8OSEEK8BH1SEELNMG===="
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
