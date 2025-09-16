package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "k+D7Y804Pv6frgEYyIPbOEyCNX8N/pWOmwWTHJBzncw="
								"cue_types_gen.go 1":     "diC1/PZ4qkfPUVqauRyJpnIf3v2c7jlzTmMJGwYHq7c="
								"example 2":              "hQrnPWthOaAyVczG3jV3WjODDG/Y+bf18um6205HJ/g="
								"cue_types_pet_gen.go 2": "5a7k5UWtN2QB3OhfUBj3V1U1gjWX8TPZe/3TjCVi7ms="
							}
							multi_step: {
								hash:       "LKAOG1M1B2N1T527U6SQUQ0OL9MIOQDAUBID9ALID9A44UM6S1AG===="
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
