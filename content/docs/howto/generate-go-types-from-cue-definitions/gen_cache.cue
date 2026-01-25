package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "vYBjc9vnwyLkQ6ES4RVj74TYGtbyS3lN5mQlcuqIy2I="
								"cue_types_gen.go 1":     "mfsVgA60bpAuKRintE+sH0JdkmrRHJ/U5vkeZKtxc0c="
								"example 2":              "b3b07KKcakrmfTUbJMzWLAVtLe1E+fTtVilsOVCbvqM="
								"cue_types_pet_gen.go 2": "MXjkUMLeQmt6DEZna3TJA59QxA1hP6LlGgamOiwOtsE="
							}
							multi_step: {
								hash:       "CPJ4UFI79CQ4UKUU8NDB31AJ5ACP9TU4GSH45SOQHRATRNDMB4OG===="
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
