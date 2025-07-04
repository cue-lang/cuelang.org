package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "N1+8PUnnFlyfeMmjIuWMkjVTy32t6CVD8Cj5k2sG9vo="
								"cue_types_gen.go 1":     "ilOtsfE2e+Ezpo1eispQOjNq2+v0kcDXusx/B56iKZo="
								"example 2":              "Kp/c7w6PMSnFqqoNiLzonL2y3lU2QuE5O7pn0/bxhe8="
								"cue_types_pet_gen.go 2": "N5DpU2aRILdmtMvCBb2las/CXYMF4C8CteLA8EJtKwQ="
							}
							multi_step: {
								hash:       "KK38EMMJ2F258SCSRE62BOBPKAGOVJTVMQFAFIP2QJR90ORK4420===="
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
