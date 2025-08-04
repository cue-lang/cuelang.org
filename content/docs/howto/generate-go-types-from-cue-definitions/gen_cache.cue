package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "wQStZ3+zm0sGO6+xT8ZCu+FCPxIQ3iiPrbxWH4i22mk="
								"cue_types_gen.go 1":     "Hv2ynnT5XNQwExYpkW3Nsyf4rwfOXyWET+HEcWrz5Dg="
								"example 2":              "VCPhPsEA0rEJhWAFQn2qbiGuB/+l/D5LBBm2JVYB4Vo="
								"cue_types_pet_gen.go 2": "uiuP2DjzqPv0IacmtvbIePUUo2+gvjjSDeGXq7Oech0="
							}
							multi_step: {
								hash:       "AVS1VJK61KLA7GPIH24N6545LL9RQ9S96CQ0C59C4S44HSMQJDSG===="
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
