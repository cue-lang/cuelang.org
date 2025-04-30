package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "rFarHmWQDD30/uUuS7jXimcXa5PRmrkHNX0mrzDCt7o="
								"cue_types_gen.go 1": "wIDvUWgZ1AdJ3sZDwMxTmlrWJB9Ui5uUniEpoBBEpYw="
								"example 2":          "tfaAPCpyhJJmYdeQ1XFfBm+ToAiTrCJN7+vaN0FIGIM="
								"cue_types_gen.go 2": "6HvFk6TiDFkh6ywpvYSUAhmJGADXO9wGn6l003eoIMo="
							}
							multi_step: {
								hash:       "315FQ8R8GNEH4OSVI5CTTR7HVHKIRC1O0H6G1NS87OL9O6CM257G===="
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
