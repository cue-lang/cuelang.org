package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "jBq1Bw4593CQ7eFlLCQ5qay9nFJB2APTx/VmlZNU5ns="
								"cue_types_gen.go 1": "78RYcJXDp/87X+dya0551smSCLGgYQ7CQ5kYm8XbWuE="
								"example 2":          "CX7Q/r8J77hRK7WsSofsdikRRRkW/Kmnc/vUVE+TnSk="
								"cue_types_gen.go 2": "twcvn/o3CoOU84UvZqdcvkHYosjb88F0htSL9c/gLhM="
							}
							multi_step: {
								hash:       "TB9TKP3BB5C9SUD53U9QFTS6LQB3EB6GSR7LGD4R5JU5CGSC7GT0===="
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
