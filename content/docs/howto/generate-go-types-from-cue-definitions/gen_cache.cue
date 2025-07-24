package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "vmqUNfA0f2tHzjN3lxyxJbs0tXQVktwPGy9AqlaGr4I="
								"cue_types_gen.go 1":     "qmxxbHszt+sYTSIENJL3xzPKmq3FLB3Vw2w9k1tDfDo="
								"example 2":              "4DaI7rHTQwV/+zdDnMbPLNp9vMtXx7+Iq9OhfzZeNtU="
								"cue_types_pet_gen.go 2": "7cTmiy3AS+WWSSKny7ERK1qeKLjZv/zaQvBiujusaXs="
							}
							multi_step: {
								hash:       "GI6EQQRPNT6M2SNF8A88KLUUQK57BRNM2DT0LL0ER9I6M1QJ33KG===="
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
