package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "D1sjtbLw4i/Lp+quAPAiSRQYSTMnryQX1D6Lr7KW/pE="
								"cue_types_gen.go 1":     "5k/F9cLUQbQkyKA17spMouxvwZPQmI0pZkHotQgDJyo="
								"example 2":              "B34m1SKxL7ROU6nUeNVWf7ZQoAGjAzqQ8xP/UboJv6Q="
								"cue_types_pet_gen.go 2": "82bOYB7dFlWOrIXMipH5I/O3m3JQ4tuHAxAIKIriils="
							}
							multi_step: {
								hash:       "O9MQJRNMTKPIJDROMBC5ND6I8915Q4LM0S89J4NOF0N9A346O8V0===="
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
