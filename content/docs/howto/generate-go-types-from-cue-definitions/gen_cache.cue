package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "+ioxVnccA8D5zXo6YYE9m6tV4q+4lyl2sl+8r3LWdHE="
								"cue_types_gen.go 1":     "iggqVhhazFrDjXNP5wT9CCydc3R5/w7pDMcQEU4rD6A="
								"example 2":              "KY5nvmoF/VnszCxk8sDQDPY+kZr6N7Eyzrj58UdXshI="
								"cue_types_pet_gen.go 2": "ReM5zDkPtFUcrO5V35wuCJQCEF+eLZPMf5q+dFa8SMA="
							}
							multi_step: {
								hash:       "K10R72MFM7451DJ7B230CS063SA6LT24ADO1JKPNIN0U92NJGVJ0===="
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
