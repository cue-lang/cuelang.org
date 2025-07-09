package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "YF0uH3zhaWMaKB0qWKha3hhqnZET5UlWE/wPqXdJc4o="
								"x.cue":        "wyIYQsBHjDatoAEqohr01WBOLNt/qtaPdR+fRkqXAzY="
								"x.json v2":    "MwdhJ8nF25+vsLEqw49658FjMiefa3eg0Pk3stcysUk="
								"fixed x.json": "tnyfGSgogCXyLlK9GqzCuT4LnvQ/195hxTSpiNnJP2Q="
							}
							multi_step: {
								hash:       "090AGL93PVS9HO2BL2J4EI7UJJKINCJ2LID5J5K28GQILKUD59O0===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
