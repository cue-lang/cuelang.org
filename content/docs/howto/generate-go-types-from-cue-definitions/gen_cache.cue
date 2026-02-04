package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "Y9wszy1wopFrDQAqrYXnQXWKOGnGLY0a5V2OLNSMrVA="
								"cue_types_gen.go 1":     "BKsyZYOLWgGJUauYjQJ+YEgtSrnOv9K9uVcX/JiZo5c="
								"example 2":              "nUCMJxFcFlPVY3/4f8JELSgh6gSB12ugy5AGwH9eslc="
								"cue_types_pet_gen.go 2": "5YTKqPBEPgtuyyRKvJ+EbWY7CtEhG7fFjfz2zMHN3N4="
							}
							multi_step: {
								hash:       "JIQHHPRFQVB0PVGHU2DS1OAQBUNL768732II121MCOA4DQ0MTVSG===="
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
