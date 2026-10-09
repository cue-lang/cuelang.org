package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "yfXxBaw2pSaupJRYdWXnQEazrUb5GDjpVgHgHSDMpxc="
								"cue_types_gen.go 1":     "s3NDkETFKYvcrQTdJhPhLi7w0eRVavLRM24mgTE8QVs="
								"example 2":              "lTAMLnLo9Wb2vd8doUuj3XOV+5HXIHMJTdlFBDXf7KM="
								"cue_types_pet_gen.go 2": "aV0T18MdeS0hnlukODKfwp9tZmx5wNmRz6vzcLHq2Ic="
							}
							multi_step: {
								hash:       "01UE5CH12LR5JD60C0ML9J7AIDHGC8RFMOUSEM45F37F3SA3PERG===="
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
