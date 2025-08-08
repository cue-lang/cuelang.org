package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "OgWIv0zBS/7a+uQ/6v7gYRnabEB2xj98YLPtPklt5Tk="
								"cue_types_gen.go 1":     "epzPUvD/CCk0vF8Fpz1l5hg3T8hebIL2Zu/S1uBDeSk="
								"example 2":              "VteDAY1cELhdYCUqOlDOmTksooBp8Dzf2uIgO870tc8="
								"cue_types_pet_gen.go 2": "ItB6rPIsEIB6Ae2esKtf7Z7MBO+PkM/5qBCVHUh0+NY="
							}
							multi_step: {
								hash:       "39JNS4D17U656700EGHI8JFADV0KE5RT2UBSGMU0HK5QJ7CP3PV0===="
								scriptHash: "ENTKF17DD7DNV7030J6UPAS40QU1DIO156V282TQ7OB9E272PPE0===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c # Check we've not encoded anything odd in our CUE."
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
