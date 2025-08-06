package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "PAdcLzn01qrSfVvSR4EHj2aCEqJbysIjSBhoxpaVK4Y="
								"cue_types_gen.go 1":     "Z2aKr0ZGmJQgzAIpk9cBdb0QEDhMlfoXntnvTzpmCYY="
								"example 2":              "70aIlYLuwnR7bmpeHt5X2dHP647blkTqX2Vj221ePwI="
								"cue_types_pet_gen.go 2": "zPnmcBPLyQx12G/fN2zNJ3EFgHLFWlUUvRGjQAzj+Bk="
							}
							multi_step: {
								hash:       "D1P2IN7P43MEBODJRSGM6IG7CV68L5TD3876QM9Q7NN70UPL3BBG===="
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
