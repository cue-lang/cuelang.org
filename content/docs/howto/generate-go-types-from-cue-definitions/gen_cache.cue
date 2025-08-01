package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "gHNcPa8LYY+Z8jYvPeQyQfiGoGEIHNZ2CkFpTYIJtI4="
								"cue_types_gen.go 1":     "Da0tJB+EUxPT+W5Z1w/woIozkuHOFuarnGGrSuQmty4="
								"example 2":              "u3wmqC1rTlWjgQeRV7DxtIoNtMSfebwAL/gQdAzt1wU="
								"cue_types_pet_gen.go 2": "U888Zva/W7+5kFjLTk1AdupgRVbdBNRCFr5ZvZHC0UY="
							}
							multi_step: {
								hash:       "PTEUUVV1Q93GHHQ1AI0A7BQSK4O193U9JK6PBL3IHQSCRTFQA8OG===="
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
