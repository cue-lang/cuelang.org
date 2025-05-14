package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "YrWzVOA8Kk0gVvZGUf95ECCfBI67ms+EmjfSB6z7fvk="
								"cue_types_gen.go 1": "EWAU3JOXMGEKJPjAOUdoIJhQO9nYFXJjPIM99NbWly4="
								"example 2":          "isZFtIvOp2Yv4y3MMJ0y9Y/mu88Rs83W5LFdxJk/3Jc="
								"cue_types_gen.go 2": "W1i1V8/DEgRm7YaB4YPvTRgPv1yw9dWFa2nc/FXOr2s="
							}
							multi_step: {
								hash:       "VUDF867877SP4B7LC226O1NJE96JA1OIVPAMOHV8G37K7UETJ2K0===="
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
