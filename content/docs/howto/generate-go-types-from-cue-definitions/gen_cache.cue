package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "f2we13VmOjhg4Shb7tWCV/micvskLYeCPy+Cc+kuRJA="
								"cue_types_gen.go 1": "MT/VhttzUiIRsh3wTPC9eV7ZdLfIIvYTWxnz0lFV4T0="
								"example 2":          "wPmeCB2tLOD3dzMgIZjMBFk5uupM2h0VeiFuNZ2OHJ0="
								"cue_types_gen.go 2": "LdNj3cW7IgS8zmkwez36AKcbeZoq9tjrFF/a3nk7zSM="
							}
							multi_step: {
								hash:       "5ANSE0PKPUT1UF04M801LP1CMSEUJQUV06BDOFHPQE8A27RJLA7G===="
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
