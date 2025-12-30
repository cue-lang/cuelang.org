package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "luxiBUC4XuBlj0hL5iDyXn9AqBxrpEnfqyjCadN8Rkk="
								"cue_types_gen.go 1":     "1+lqpy5xDxnIzCz1uIOQhwuskTP1q7f4kknmLuBiOcY="
								"example 2":              "bNvcZi7XTgH/Oq/nY8jV3R1NteA6ObcZ8NXHhVoUE84="
								"cue_types_pet_gen.go 2": "z7dX11gpxyYV4rgos5bnIjcXCsOOjLgKw7tByAyYsCA="
							}
							multi_step: {
								hash:       "R5LQ8DM655RHHOIMKKVKIIRM7H5BHC9T58BFCLJ45J7GUTLUA3EG===="
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
