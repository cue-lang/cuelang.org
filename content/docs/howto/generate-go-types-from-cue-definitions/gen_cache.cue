package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "kUu14kpqfSHFrmi0F70ern7QqKZD/E4xTsX0o9eV8D4="
								"cue_types_gen.go 1":     "AcxqXDpK+qwMOsr96Ldr64dbrWLWDbO/mA+lcN7peVs="
								"example 2":              "gCn1rOGEWFUShGdty+CQmypTU8KFyzIQ1yRkw3PC70A="
								"cue_types_pet_gen.go 2": "k4igJHEBqkpUVwAtpWyH0Z6LE2850EorWRBs4WnxXqw="
							}
							multi_step: {
								hash:       "25ARQTGKFMIT01RR72MH3BT6J7TUCMMKOHB406IH2H2L3RPPNJNG===="
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
