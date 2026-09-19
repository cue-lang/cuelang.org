package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "g2weEJQcDYYtKycQFJWxE4mb85RmynbMzhN2ahOUBsk="
								"cue_types_gen.go 1":     "C1pWj2GFItoH1PMPSJ4EBXpCMkxH52Tb+ZlnqpFG8TM="
								"example 2":              "DhIAs8Rlffn7LexOHoUIDSWBj/ma0vsvlHBjdB7FXes="
								"cue_types_pet_gen.go 2": "RSjPJcYs/DKA0IiRRWj7UF9gc2yULJeBoGTHKf9rfo8="
							}
							multi_step: {
								hash:       "8MDRJN8CUU09HEQPJDKDCJV05C38TA210RR0JU2O47PAKJLLOFA0===="
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
