package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "qZZ0c/tMngT7te2G4lRniHhJ4HVotWVEkZ6Lbk7br9Y="
								"cue_types_gen.go 1":     "JRgXua2b2I5MKhaO1OkKOfJU1LYP8YlB/zJD1oAmx2w="
								"example 2":              "9meDd4Ae8daZiCtQFX1wosDbvbLW9PgrgBis6vhk0l0="
								"cue_types_pet_gen.go 2": "avYOxVyja9VWyczLRDs3reRNkiDPLJKouMMmvA0VdOE="
							}
							multi_step: {
								hash:       "HAIMHQ3JFK09FU569HKILVGMP49N93TQE9QE89I2GB7015PLC3VG===="
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
