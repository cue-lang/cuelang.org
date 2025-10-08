package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "TrjrNT+n/1VqwE/zHY0SSQn7LefpRYUeIM3KWr/XjKY="
								"cue_types_gen.go 1":     "n1KMUynWTBG7NnXP34dY+xkGMf1V1NhVU0k9U9m+4Q4="
								"example 2":              "FhwVUst8hGYH5nTIhL1sn+Wjfhv5RIkndpwDuo7wH8o="
								"cue_types_pet_gen.go 2": "poCWjslIXH+yYzHgDNQZytkVtmtvQ5jU1VLIqJFZMXQ="
							}
							multi_step: {
								hash:       "K7AURH1O421JGEFHO44PBS1FUQFMK71J2TOCUGMB2OE8SSHSAAUG===="
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
