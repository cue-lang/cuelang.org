package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "eq/TJpYSFEMqyQDVJgXtIyjrWK5l/yOwG6ie2+h8+oE="
								"cue_types_gen.go 1":     "BYTwXHhqueDifOlkjdi21Xh88XStzYEJv3VwWxaVg0M="
								"example 2":              "pCC5y2MOIgmd1QgyjPwz0sCcxGN1tqZbcoXgcyvCTbA="
								"cue_types_pet_gen.go 2": "Jae3D0eett/lFX9IDsaHgbxomfj0FkN/5H+p4VMORsE="
							}
							multi_step: {
								hash:       "FTJAGDE89QLHSGP6U3BBR1SIIT8M6CC157OAJ2IJ5UFGCD2I0CLG===="
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
