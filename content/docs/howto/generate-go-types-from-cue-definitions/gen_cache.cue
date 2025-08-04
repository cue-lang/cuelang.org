package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "wRkfyz5RQCeVkjkJia58Oh6B44zOUIXdhihikW2gFK0="
								"cue_types_gen.go 1":     "bjF+cQlRlrS8I272C2Tuf6t2Lf9d7NtoAHGIEL0zftc="
								"example 2":              "8DAbA8ql3ZecLSLASFbKj2TcBtlDsgLqn/4HLS8Opn0="
								"cue_types_pet_gen.go 2": "8kJ1Sm76DP1BcrlpeLauXe6izozPiUJTSehoW36eU2Y="
							}
							multi_step: {
								hash:       "BE26ORIDDN6AQ43N62J5CHFV0TOF8T9N580QH8RCIU88QBIG5QC0===="
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
