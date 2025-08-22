package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "E4/SSsTjl8UIoJo2Dgf1V530HWptwm3ZMHFpjK6K0nE="
								"cue_types_gen.go 1":     "ZxisMX8e2slGSPni7zTKjMo/ZS7S6jenW1wjHMK2iKY="
								"example 2":              "PWrvLXz7t3cpBEJ82NcVg7wA2YMhKIZQXHzslCdckLQ="
								"cue_types_pet_gen.go 2": "qCnLvf6xyMaJs3EspKdFeGfsrq6MnwQnnPpTgmcmxmg="
							}
							multi_step: {
								hash:       "0D96R9TN39R3OJ4RSAJTS7L1HNUJSK2JQKI7SSKURI5R7421B740===="
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
