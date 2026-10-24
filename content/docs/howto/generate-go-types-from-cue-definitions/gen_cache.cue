package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "hn4xkN/zzNZxUwYEeyMWv7D72NOR9yum0f9brBRvZaI="
								"cue_types_gen.go 1":     "mBbJV74IbI3eNcS/75pbtwwjVgjkJNdXKuFI0gWPqbU="
								"example 2":              "Mu3IqfXJKJ4Qwepqr7V+4WZQOUtF7d/r/w3hXp02SJs="
								"cue_types_pet_gen.go 2": "dqz32hZlk6a+aGlQ9u28Nw8yQW0lCxH2Bzf+hxuP6OY="
							}
							multi_step: {
								hash:       "KRGQ80TS68NB5OO4FDNPIMJ7S1715JNLGGTN2V2NHNNP1FTCMOR0===="
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
