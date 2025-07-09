package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "FIVrEJL0ILVZ5nnGL0ASHI8O6eTis7zOovIOJKSpmxI="
								"cue_types_gen.go 1": "ChdlG6/5VVqlSMjO615modckDs/2OovUuy4qXmq44Jw="
								"example 2":          "sjigH6j1lZv8SDrybvpZPr3jEhHJOdChf06UfetLPW4="
								"cue_types_gen.go 2": "rqRihu/tX3GOYFaefoTD1tmVzDkSEqYYDxUERxPOmRQ="
							}
							multi_step: {
								hash:       "NURI539RONA8CDPJ00RRFVIV9EPT77E9Q1L5C3LBDPCLEFPLO97G===="
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
