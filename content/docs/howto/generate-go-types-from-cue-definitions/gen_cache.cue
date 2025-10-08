package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "1ncjqYQfLuCM1dL8ZqPqPnaiigiw4LfrUKgnl7/pY+o="
								"cue_types_gen.go 1":     "hlht4W/o3CCHWOybteA0WB/9joAqeaIH5jFp3pHu3cg="
								"example 2":              "tqNqubQojBjQ66iRXhvJt/I6eoKEfa3525YUZZqFAcI="
								"cue_types_pet_gen.go 2": "fs1FhKm3n9ZMP9Aai9jtD8z8WXwvxmfg5IL/SxJjSNw="
							}
							multi_step: {
								hash:       "FTH617F1O0AGICP89PB72DFDJ4PAR51I9CPNU7G73GBL0M9GUUR0===="
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
