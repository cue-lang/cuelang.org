package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "E/SAX7JHjPGDjFE1hLvcXB9Xrp0ku+ze/yZIhcf0U04="
								"cue_types_gen.go 1":     "t3j7cSWYnx3wjzguBzffWDXukIw/L7nG9RHNyEDtXyU="
								"example 2":              "HQQduJpNYN/l7mWmjPvKJm2COrjnEPAgNTynPCYWKTg="
								"cue_types_pet_gen.go 2": "IKxZ23OVAfZJ7Zb9n6xSLFuA478h9HPktjvDVZq3HZ0="
							}
							multi_step: {
								hash:       "JR6TDJDCM0VD7LLFEJ55DUC2483I6IQOD0TU8UAMNM36GFQIL8D0===="
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
