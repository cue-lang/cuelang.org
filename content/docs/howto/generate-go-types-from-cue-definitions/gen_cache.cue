package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "yu0wgqxR4ZrNs/nGhfzD6iMYGs1ZL65fDoPa+No/RfE="
								"cue_types_gen.go 1":     "7iZAcl0NrMeGgUEwgtJdhSwN7NTIeG2KmiPU+zCBDBU="
								"example 2":              "m4Ti/IOgUYCEUPajX3wmnz3He0ZxriMTD9gujbz/RUY="
								"cue_types_pet_gen.go 2": "SiZzeFn6yQg/RqlcIyd0cH5yJOIe4r1/2SzghcB+4xE="
							}
							multi_step: {
								hash:       "K57445TSE2FG12OGDQV4QTHAQQHCIBIRVIDCV7GENAAQ7FQ6GSTG===="
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
