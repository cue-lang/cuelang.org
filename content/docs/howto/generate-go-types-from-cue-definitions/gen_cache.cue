package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "nOqrRA7067Ci54qWEWwk7czXJxvgL8H5cwS2Us/LhHE="
								"cue_types_gen.go 1":     "qwkF33zS9z9jFgGDSlhf9SyTEEw4vjnodDB/MMSEuIg="
								"example 2":              "a6AcQX+FwzhULdgC50GQAC6rM3zsu9mob0+70c67cuk="
								"cue_types_pet_gen.go 2": "ypIcUJi5HOflQ8zXpMBtGOSftRXflOWsOcxvnT7stV0="
							}
							multi_step: {
								hash:       "VB3VSNA237GFDHTHCR57LC7PS193MTBV1T7MVGO5JTB89I60LGS0===="
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
