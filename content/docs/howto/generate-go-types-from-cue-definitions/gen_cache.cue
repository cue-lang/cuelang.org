package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "OxK3tdRTlGVk3Mz6TRsczJrqP5xtuZg8mxSqUGG/AeE="
								"cue_types_gen.go 1":     "i+sWKUB6cFvwm+nLS9lBs3HdrH9WizUjD93F+lY2T6U="
								"example 2":              "iZE4W4FMe1cM4UCqn+0dsyEUbzFbYyR8KeXuBvmvDr4="
								"cue_types_pet_gen.go 2": "IShLlX5IIrahfD+GH9YpJSP40QpHTnR2OTDAd1hWr9o="
							}
							multi_step: {
								hash:       "M480DCD5RA14F863PT35LQIKVTP9G15E4V6B7UKOLRCFPT77L7OG===="
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
