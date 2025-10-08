package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "v419jUoFFF61b4hhtmWq0drUVvT1nATxSBiYs48WMVc="
								"cue_types_gen.go 1":     "gnfX1mo9lR4Ufb7WqZcD8F0QemIKUBPQ7pAmIwqvjy8="
								"example 2":              "+dqfm1Zw4CgxX76j6SjkGwzLdNN6yDET8OSwUgf+At0="
								"cue_types_pet_gen.go 2": "Tt98a8cS+iVJVnqCEfK+x9Wk34rRVahQmS4nt5zEv2o="
							}
							multi_step: {
								hash:       "7MOBG9QQFIIKILGEVJPG8VOT01L201P3J36S0M2U43ENNRA9VC8G===="
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
