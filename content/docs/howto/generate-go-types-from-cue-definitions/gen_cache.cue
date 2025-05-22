package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "afjsarewWJuJjc80n7FWqD1gM64L8HW+HMwgUtfHKJs="
								"cue_types_gen.go 1": "ZOu68c/dNGUodjfZVf+qUp+9RhUlT9KafiqzNn1r698="
								"example 2":          "6UOkg64Gz+DlycX9Si5mF3Ep3Ygba5mSo93pmnzfMjA="
								"cue_types_gen.go 2": "A7LUU04b6MrlNGZ6ja2fgp33DTzB5oOtQ7uIchbjTR8="
							}
							multi_step: {
								hash:       "JCG8UPL0UCIM2PLEQP4Q76HLQHACF6LSTQCCKLCLH01C69SJAPH0===="
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
