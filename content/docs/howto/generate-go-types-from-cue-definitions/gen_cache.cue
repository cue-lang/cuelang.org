package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "dr1/T80iJZSyH4c5NX3RV+H+2bzoVoIePTuqF2yCzBQ="
								"cue_types_gen.go 1":     "OUHwFpZrsLSnzlYUVDsm0j5ViZko2Y+DpRGzO4a0enE="
								"example 2":              "fc8jeYqWps6h/k7OwOFjhneqd77HIuQTPtwgPHg0d7Y="
								"cue_types_pet_gen.go 2": "cA5PPArj9sjnfKTf5Zh02vjWOTGOKm++luwm/CAkd4M="
							}
							multi_step: {
								hash:       "1E4HCAVQ57BSIU7CJ3A8OCP78K4JKUT9M2VEQ7GR8FOF5EGKH0IG===="
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
