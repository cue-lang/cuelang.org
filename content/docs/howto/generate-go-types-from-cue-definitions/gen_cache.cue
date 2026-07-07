package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "eLgtACoMXp0HGA3QrHyN5pabixZbvT+aB6gaK0yNUuk="
								"cue_types_gen.go 1":     "dXG5ScN2NIAIM/kZ6GEXKKiEEihogQf0ssfb/8LKZIk="
								"example 2":              "IEibNie0aEtuAVxYQ3fA7wxLUQS4z6CQmA0nT/8s5g4="
								"cue_types_pet_gen.go 2": "vJuGDQbWh1LarDqIqhd2XQnOfu/pmqAFyD2RlPwO9ZA="
							}
							multi_step: {
								hash:       "I899RJDU5O2VHJDPFOMEAM8K3CEFO6OJ7DMEH5J3EM41DOS8NEM0===="
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
