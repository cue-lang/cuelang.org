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
									removed:                 "wBbZE/ho6WaQ+rIm1KmGKFzHsF9J+wRpuwSls3Mc0bY="
									changes:                 "T9MAb7pQcgg7Q7mnF+pTXVT5j2TesycsPQUXf6lcFb8="
									"changes: updated file": "rKmpqzas6sec+zk707os4OVjbDuwQOLRSWNhjp3WPN8="
									"references: broken":    "Hp6ioOFEXCNsehfUnoOqSMylQwS4ThIaNfMBqke0ySc="
									"references: fixed":     "jAuf8gFqkPsrOKCqRhQQKCwQhXiSY0vfCNEUFjRr8I0="
								}
								multi_step: {
									hash:       "PMV22O936RQKDL5ATGIQGNQE9QVNAC74GTQG5S77NRJ0M692J5PG===="
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
