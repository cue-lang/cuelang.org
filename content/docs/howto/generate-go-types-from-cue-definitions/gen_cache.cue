package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "pRxhm+cVPLohab7I6Bk6j3iGY48bbWQVymICTRYyTEI="
								"cue_types_gen.go 1":     "gfmAU440MzqVlj50s0MMLS4mZ6T9aBzA4KHcQZKT4D0="
								"example 2":              "BEceB5/MW/nH7TeFJ3xk6sqyAcaNaz0rcjmN/yIHPqQ="
								"cue_types_pet_gen.go 2": "Eqcv64SnsAyGorlbNM2AaI7QoWXprg1fwae9/3///lI="
							}
							multi_step: {
								hash:       "JHR2BS69ANEM2SUHICVT06HO4SA8FTAE2MD6GC2T82VB809QPQ10===="
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
