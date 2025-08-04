package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "AnKFjudFsOR3s6FKdzIhDVLsRA7A/MrthJCkX+Lx8P8="
								"cue_types_gen.go 1":     "koQm+MhY/WEehB2+EkVMA6s4Ij37Y62SjYVN5wKH1Nk="
								"example 2":              "NY9o+jzz8K4M7UJJyY9DsRvWrltJQl+Iysl/5mCRQFo="
								"cue_types_pet_gen.go 2": "XnmEOjNg9xn4y0vH6H9gSCqFYE0yPKRRBlo4dB5x6iA="
							}
							multi_step: {
								hash:       "C7BFGJC2K07NTFI5H41DS4HONV2BLK2VUSOB1PFCPGG61C940CV0===="
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
