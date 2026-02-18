package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "VqrloqUneZ2fqYuYaQIE77Dok4qfW/hz6ORTaZ27OPw="
								"cue_types_gen.go 1":     "F+iNhgFr83e0sCOoS4m1XB2NSpLjj6Vg0quB7OEiMbE="
								"example 2":              "IRZiOAPtXRFpkReD4KU+CpzXt+JBf2HxGJkRu8C3Mhs="
								"cue_types_pet_gen.go 2": "NY+romAvq5oEx3SIRNb35Wr8HDuxlC2PFSmi9JMoYMs="
							}
							multi_step: {
								hash:       "DLRTATGLJJ7JVPPAIK02ST8J892FMO5FPAQ8GC8B0RU4RQLLMIS0===="
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
