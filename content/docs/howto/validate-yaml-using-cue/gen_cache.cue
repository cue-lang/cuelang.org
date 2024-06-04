package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "CEzXwQ4f1wkSP/HziyGAE6V9PCJHeccLZhyT3t+uzQM="
								"initial x.cue":  "m2lAYhPn8kQhpQ4ai4ON033Pb68ZmJV9PFZ4t8R2Hoo="
								"another person": "HFOMEKevQOoM6nIjGJQO2k22ttRwl+vD6yfWOZOUSyA="
								"fixed yaml":     "6PzjDoCiXXVTBUqDTAcsO5ArUAntV2DeQrJbS1kzydI="
							}
							multi_step: {
								hash:       "7973J4HRJLTPQ7EATK98CJVAB1VAVL95LGQPCKITJ7E3MS4ASM3G===="
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
