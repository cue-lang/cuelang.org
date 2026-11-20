package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "9oJ3EDOZIkUq/z3WtteQPOG2jM8cIwwrJrBflXohdII="
								"cue_types_gen.go 1":     "NvxyViLV8aZgroFFJwNoF00sRHLZGBPKPAvi5gbbGOU="
								"example 2":              "40wD8cOzMS8XnxmHNkiisOaS1tXwzJXH12FKYiTczmg="
								"cue_types_pet_gen.go 2": "iaM+wEESRkT57FjtC2wCyFWuAUca3SjGGOIdPnHC304="
							}
							multi_step: {
								hash:       "D0LKAJ6TU57VKRQ08JTJI59GIF6H61UJ52E8DTTE7DR0T02UMLQ0===="
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
