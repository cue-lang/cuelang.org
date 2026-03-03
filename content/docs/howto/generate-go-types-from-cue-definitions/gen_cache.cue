package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "DG9pwRvAY+mkHPFPPEMDpc2cXeb/5adB8y0/2WfIFQY="
								"cue_types_gen.go 1":     "q2cHgc2JOGMFrhT3XC1hGfptoyLezwPotQjGz3X3jp4="
								"example 2":              "dRrDkVd10E4NGrZkP+foD73xKaxhWlPiYSaznIWDT/U="
								"cue_types_pet_gen.go 2": "8doa56iB3jQm1tHEsntoxV+umLiqjfKAKFqjzfi6ZLY="
							}
							multi_step: {
								hash:       "NS9N686E2I5I45IMF5CRBN3DR0SPA434R8HSESQOJBBP75QGOTHG===="
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
