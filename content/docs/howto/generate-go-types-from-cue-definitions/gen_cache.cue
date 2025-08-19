package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "rjNsh/ZwODK+yrEX/jMmN03tKu11FtyEtSwFPkP4ht4="
								"cue_types_gen.go 1":     "p3YodGNFyqowSQnZqwwCZLxNlNlu/P93kMdwL6GewXI="
								"example 2":              "cEaagtq2AuhWGvIT/OU2eRTJsB9h2iPwlOzljr1+4yc="
								"cue_types_pet_gen.go 2": "EQ/VtofXPO/ZRTx/850qOMmCYnLhQPPPhne19URxIm4="
							}
							multi_step: {
								hash:       "PQ2VU6ULN368LJP2OD7NNVD4A7H6TTIJFV2FUU1C1HTFCEHPG2P0===="
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
