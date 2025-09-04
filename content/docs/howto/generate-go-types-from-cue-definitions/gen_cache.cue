package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "QuGuU6KKy7hSGz//eEk1gumTCnM4dBQUV45clxLsRtI="
								"cue_types_gen.go 1":     "y6gsfrBsHlrYzDrERcYKrSZD/6GN7yFjfTPvy86bjt4="
								"example 2":              "dat6NpnilYror+IwgEChbJG1l1V3inyqGalA7gB8O4w="
								"cue_types_pet_gen.go 2": "9Qt8Bha7enE4JZkd7kRkobqquazznEVXOrB7VD7qCZA="
							}
							multi_step: {
								hash:       "9DCE0RC70NVF7G1LAR11R7IDC9HJBST4F74SDIHARJDDS49CFK00===="
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
