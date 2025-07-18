package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "dgrhSalLXYxNQnnTWYja9J0F407O/v/9RfCvUpd2Z1U="
								"x.cue":        "MqvqLT7GD8jGWZu9XbrAxUDRXBA/uSvlTQ68S7YvLQ8="
								"x.json v2":    "lB1PatwvUE7vNovuOmZQvMon5sl4C1yPiRgxALfGfFM="
								"fixed x.json": "rbPslTrOJ2ejd0F4BpoiuMjcJF2kPA2dftGLmUEVBuk="
							}
							multi_step: {
								hash:       "505UBNPB60AM6TS2D3O4HVQ93R4OP3QS0D370FVNKQSFSIQLUETG===="
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
