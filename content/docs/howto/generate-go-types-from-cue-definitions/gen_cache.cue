package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "CfQKAQClXA4uUvjVxr8vT0fOjginse7TRp5n3Rr252I="
								"cue_types_gen.go 1": "s9hSL8I8/tMlVclEZSpCZm+H8GOMd8k6SMjlQgyR47o="
								"example 2":          "4/vvjtArZSi4SeHhNk0UPhx2YNrotWajaKcfKZpTrLc="
								"cue_types_gen.go 2": "RxbVFpQaj3sOuiulLDRahs1kBrXg3U7eEbJxHjM44E4="
							}
							multi_step: {
								hash:       "DMDBTHES6MBOOJBALKC2J3VVA0G46CFCAF34MF5F0VU82HJU08OG===="
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
