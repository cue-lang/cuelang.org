package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "C9Q0xIQGW9VfZurhO5vee5bLujxHUkxKNyuYQgYjEP0="
								"x.cue":        "HcsW2fgQT5p7+4aqkzC0GaUpI8gCkFOLVtcX2+enTSw="
								"x.json v2":    "00O7qSa3oSN83nSfqHCenCIuvMj0XynpAirpG0w+Ksk="
								"fixed x.json": "OrV0VuheZozO15rjUDRye80FgXX2wfU3dh72wo2o8rE="
							}
							multi_step: {
								hash:       "C2RP448Q6G4SLCCFNNNOF4INI1LFIUDIC59U5L1MTHVFDE3J6HH0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
