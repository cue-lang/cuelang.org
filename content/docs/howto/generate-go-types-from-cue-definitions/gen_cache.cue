package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "ldu45WSHQg2NqJxiqnXvw3DONYTM7qT5zkLG5tVcOUE="
								"cue_types_gen.go 1": "Sg0XljY1araeotNtKqUrRFG/yU+Y86ztfiekB1vi2t4="
								"example 2":          "BZqz8i9q7Nsy8RT3Bw0vE5FZzm9IXNaEnhYuip8pioE="
								"cue_types_gen.go 2": "CkqtZIrbNBrZiQQ0Ph8gDwgxdHc6WbSjdeo9/e9zubQ="
							}
							multi_step: {
								hash:       "SKRP6T2EKT445QINU4NCB8OMT0I6HBK4AMP9AT8M05MBS8J4RL20===="
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
