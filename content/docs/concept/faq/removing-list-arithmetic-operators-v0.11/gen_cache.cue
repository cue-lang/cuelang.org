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
									removed:                 "kK7gPTgZEr0Nx0OzxhvtGdEFgaXtp/twqjdwSFei83k="
									changes:                 "8cDZCoHvDqQxUyxGhm+f6O4FBUIgbNht86r0Zag8ttM="
									"changes: updated file": "qB3WCb7V+5RF0yRE9mar4M5GJ7mgyQKF9m61E5NVWSI="
									"references: broken":    "ly6/0ZQKaxe+BkyFqAvPBpDtel7JCl9xijvEnfpSq70="
									"references: fixed":     "n0JBGQLNDjqL+KtICxduDs2bhkV1X/3vxxfed2ab11c="
								}
								multi_step: {
									hash:       "M28CQHUJT3FRPV8DKP61JQ8N3KGFI3Q8M9NBOE4B3JF22FU04U30===="
									scriptHash: "VLNGG98FUABM36HDGI2AH2IQCN9I2OP2RSHEFN8T9SKDP3F1HRP0===="
									steps: [{
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
