package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "IeuDcYG3RS739gU7c611I6bDlNMGQ5CeVuRP8QkmJBs="
								"cue_types_gen.go 1":     "n9VkugIEhkFkhx3htd15VxwxSxJ+nzLTZn7rsPBLWlo="
								"example 2":              "e6ODfGHsN7R2E5O3GpOwNvsfOurS3YyeAKekjnr9QIY="
								"cue_types_pet_gen.go 2": "FmeIvjBd0GWWSasuJsheNFIiyh1cThbvd3t2Xl5HAHg="
							}
							multi_step: {
								hash:       "MAOKS8GGAOF0HF7TORLHDG8PC6GKPMSDJA29B3QFQEUQDMEL67I0===="
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
