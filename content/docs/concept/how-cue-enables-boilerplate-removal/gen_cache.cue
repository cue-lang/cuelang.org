package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":        "tnD94zjGbq5Q9/4N51awGIMlvE1ZdrHrCTwWdg5BrSc="
								"app-2.cue":        "0t2pipZlGHcH/TuAMIFRKAmEDTJaMvq3/4bL55Lvp80="
								"app-3.cue":        "c+HeH9Q/VKR38zdHGnx8Q0wZfhAmgRLLu4WOkx6lzrU="
								"revert app-X.cue": "jXlD+EoJbFqvhfe2DF5rcaJxTGwZbD5Ksh1E1I0fCvo="
								"check app-X.cue":  "c5UxduAhfU1aFJiWyjo+P3UQZLqyCZd9RhFU2f4ZrTM="
							}
							code: {
								"order-irrelevance": "oWUeqAMR/uPMRwPOqYSg/vYbzILESjOJjqYzzDxmAJ8="
								defaults:            "RDcg/EUBYnq/UpejtYlEnxSPP0slKGVL719ARsDhr8Y="
								templates:           "ZcNfIm2O9YrgtuH4m64weWBus8Z3Ncp2oRiwd77JI9s="
							}
							multi_step: {
								hash:       "NJTCUG6KSHCM9KB3RRV1M08J20VP26AIGPLHK48824B5V07KKUTG===="
								scriptHash: "L9KVA9ICMCT23M3I65GKSVD5I7GABDN5MKEMLQRE97Q4NV7H7G1G===="
								steps: [{
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -e output --out yaml"
									exitCode: 0
									output: """
											deployments:
											  bar:
											    name: bar
											    port: 5555
											    id: bar.example
											    security: HIGH
											  baz:
											    name: baz
											    port: 7777
											    id: baz.example
											    security: MEDIUM
											  foo:
											    name: foo
											    port: 7777
											    id: foo.example
											    security: LOW

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
