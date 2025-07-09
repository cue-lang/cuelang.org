package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "rD0C/hw+QRJSg61K1pBAWz3Uc78/6sshY7VCUp5N5nY="
								"cue_types_gen.go 1": "wJSdMrezCnPBQxxvnWhRjCIhLYn6ge++NSNU9Mj8TIM="
								"example 2":          "aGJYhHDuvhzrz/2fVFnLVj5K5sxjffF6Yg40kw6bm4U="
								"cue_types_gen.go 2": "gCn/1byi+JgddMKlA535EQy4/1WTCzBzi60XpdynV1c="
							}
							multi_step: {
								hash:       "47EIJP9AUAE5CI7IHL0632E5RV44IP6MPC7IG5RB0N1VJJL0K4HG===="
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
