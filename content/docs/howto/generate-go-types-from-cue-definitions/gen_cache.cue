package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "6rJ3ZuOugvhcyO5eWUr8PklR3KY9QM9bP8mHPBD+ERs="
								"cue_types_gen.go 1":     "ms+hpquJMq4OY5tR/ru0ZSEnadJu2IkJsiAApzcB4XY="
								"example 2":              "Guc76gz3mZ81UjsOm5FAvaCD1X1QcS2AVsxkYWro/Pk="
								"cue_types_pet_gen.go 2": "b6LLEew+IdQVBUT/Bdd344hQZJIHWbVcRZDa1aCdm9Y="
							}
							multi_step: {
								hash:       "9DLGRN42OUUG6M6A2HCITN7HB8EC7GR35S22SQ1U45DS0UIFI5L0===="
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
