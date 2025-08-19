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
									removed:                 "Iw0ViFTVrqnezisS1yWsGQ+ulpWOthH83pTMa589HGQ="
									changes:                 "2s32ULtiPK5H1clIxBEPBlOJn14X5JdEPheUZLwwMKU="
									"changes: updated file": "XEpzzAXkuRuky2HTkP8e3MrPdSv66+UZ9kgXJ2SYI3U="
									"references: broken":    "tKnzvWk+HbAIhfOg0u/Nh4ViiALfZTo4O/5jTlr+OrU="
									"references: fixed":     "T+qHciyDSfiBj/wVQLP9WI041QxtrwpwUH1KMzxNJ1o="
								}
								multi_step: {
									hash:       "F0TD6OR73KBD133O302J37VFFV8S5AFQBDGBVJLU01U7POJS3OP0===="
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
