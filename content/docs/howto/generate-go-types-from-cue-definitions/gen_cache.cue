package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "I0MnuzWOJlQ5bymPFSj6SGo643eVo4qP4/NxfE3UGG8="
								"cue_types_gen.go 1": "8S8VWNFrbsPpXiuwpRZKNwJ3AfMFK+MCz2gsL21Rfoc="
								"example 2":          "enfVVrLC3ChIJWVV13pdAmGKBvTmwzBXbITdt6iDTm8="
								"cue_types_gen.go 2": "IZxXKX6hH5nLHy8qb/yRU0dIPptGl1BZTq3XVLnZ8Gc="
							}
							multi_step: {
								hash:       "E4145OB9SF4OBLCF3GIAMA8OULD8DQKSSU2U4VM8EGOO1CRBLIC0===="
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
