package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "UczF0iSDi7gNNapJEjh+XQveVix9G45ilt07pX4FKXg="
								"cue_types_gen.go 1":     "tV9zqbkK94keg8u2SZhxEkyeWTkHf3qAB0QTWM5e2vw="
								"example 2":              "sSeN3pPFUBnp9RTuGdVuVkrSNj5Qzq7vlY8P24/UJrI="
								"cue_types_pet_gen.go 2": "hVKVAb9PYKO+wbiJxFGl6NcdYpjnqNGPi/Y/FAI1YtI="
							}
							multi_step: {
								hash:       "TKTGNMNAHK52PT3KANVFNFLD1D8LB5BT57CC15KAKF9COFD022O0===="
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
