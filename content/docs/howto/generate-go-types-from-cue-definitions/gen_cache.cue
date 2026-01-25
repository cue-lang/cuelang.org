package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "2lu9iHbqwUvS/dlKNMxw+1QO5zVyQK0UxKvpLf6gOfY="
								"cue_types_gen.go 1":     "fCsUIBumNC2g0GOqpoPDzWZWY1E7Tg06Nqojcwpx2JI="
								"example 2":              "5AE3NEty/9QruXkiC0RL2te9RU54RVP5uWcxC9IJjgs="
								"cue_types_pet_gen.go 2": "lLHmM3b0tE1GE+rLXpA6rZMsSoWlAxrLaCxaknZ/1GE="
							}
							multi_step: {
								hash:       "48PP6NLLP0DRN940DFN7RCPDAOUK9M3DJ17OFK6DI2F5CR0KTOTG===="
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
