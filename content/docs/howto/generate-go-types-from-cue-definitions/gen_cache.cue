package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "pBoIgnlEIpVPewlZZonvq1Xzp3nn7kPFhh9O+7vqmVo="
								"cue_types_gen.go 1":     "8PZE6yS7hE3//U97+0WVXB1HNVrmmuLF4Rl0YYnk7tI="
								"example 2":              "gOPz3s61natj2wXEAxLA10heMJRLMet0p0Z3xxuS/1w="
								"cue_types_pet_gen.go 2": "qupirIbHGmKFWJKeWNcqf2HPHe3V+tXKzhAkAjyGzNQ="
							}
							multi_step: {
								hash:       "V0MUL6R4OSN5HCVF9TPQKUO72DRG3ON7N8PAGBLCSG3ER0LAH8O0===="
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
