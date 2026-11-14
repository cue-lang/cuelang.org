package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "U3bBLv0HkvIW/a2KGqSUrRk8hYLGwOk5mcykalRu/zA="
								"cue_types_gen.go 1":     "NxtCf8NvA8Dl6CrlMs4XPFUyeUrZglYRFFtmgZ8Bx3U="
								"example 2":              "uf5T5LDb2URr7+uI9g8Znxyo9506pUdikaalyBgbVcg="
								"cue_types_pet_gen.go 2": "1bu3HlTSOMmSz7WNSqpdz3tTgfxVb59yb0l/TkXw6P4="
							}
							multi_step: {
								hash:       "D5KKBM8IBTUNKFHQJ90DF6A7R4AH9LO6G91MTFKQDB682Q6T1NLG===="
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
