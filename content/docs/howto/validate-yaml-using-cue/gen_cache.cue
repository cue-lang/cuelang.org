package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "MGKWLK420BgiiOJpyvrC6BAeN4vGVnZXjWQae78Y/wA="
								"initial x.cue":  "Q2LUaDUfCWnmKGKd1XDaTOFOv13WM340AIkZ2xWitiQ="
								"another person": "733CtrfiFtHanld9hyTrxkAOugrEp0D6FcUxLlu5ssA="
								"fixed yaml":     "ua0zP/oQfRTyRIngq4PEUsOlNPBnjEsMQPirtBtg13U="
							}
							multi_step: {
								hash:       "8APN38N4LSTG760QP0QHGCCF6VB0SF1368244OKBK1HVEJL8GKF0===="
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
