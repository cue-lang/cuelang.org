package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "RESYATZeT+7hLPlayWI6koe36yE/miFfMNzZvaCynFk="
								"cue_types_gen.go 1":     "J7NjEU0kf3MOs4RsbLryH6HO2bY7zEQCR1syQkbFTYU="
								"example 2":              "IQlIQRdRlfB9n27+dl7CMNiGF0zdqX5IASwwZdE70sU="
								"cue_types_pet_gen.go 2": "0eHXw0Yu+mqquTkauQlBysEskBNlYnteKeDSwgbieYE="
							}
							multi_step: {
								hash:       "BNKFJBASL34EOAK498AR5CJOIA22I9EUET4F90J7I4BO7N8I8BRG===="
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
