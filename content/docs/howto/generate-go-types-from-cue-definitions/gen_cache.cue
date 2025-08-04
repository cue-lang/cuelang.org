package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "44j6OcWkrOhOl4lOsCiXpKgLm6YoGVeYhIz2sEWFsxQ="
								"cue_types_gen.go 1":     "2CSNOzL1uqoeTy0Dc6CmNMAoqVV4d9Hx2XYVA7YDeIE="
								"example 2":              "iz556Pvbu48eN5rnT7VO7OjzFBYe/x6fiiAOaWBLrrM="
								"cue_types_pet_gen.go 2": "IFVjZ4/0HmBPHlBLnhGedo8lBtDVjT5izMvMqQ1i51o="
							}
							multi_step: {
								hash:       "1H0H6S15RRGF0NNVBJI2BSOJC311BOA2J9VC86G8DO89QKLAM4Q0===="
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
