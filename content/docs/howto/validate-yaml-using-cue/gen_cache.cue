package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "vqnkIk7+b9fBowUNKwiu1XV0qYUhPCO2gvD085R8g/g="
								"initial x.cue":  "u+n4I2dpHX4Q+dOmIAh45RUH3is85azcp5IRC/Hn9lQ="
								"another person": "LHNnm9UGMG0vGSQM6FHwFzeTiIqhYYHt8BNMYz1zrec="
								"fixed yaml":     "Sz1IGwxcrvdhrQoT6YPO3FvebLE1H2VpHM2OvrJrYoY="
							}
							multi_step: {
								hash:       "2VA9513CG6AV6H7F8PF9CHMENE81BFS8A4PBHFH2F1G3825PPLQ0===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
