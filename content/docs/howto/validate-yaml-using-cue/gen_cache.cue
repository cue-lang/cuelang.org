package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "C9s2DJKJgek1gQOUVRW0fwBctSnNORK8yfV5NohhOjw="
								"initial x.cue":  "BHRMAcmuqejC2n9k4ZS2Y1qgMVqCskLtmBZXSCjsYAw="
								"another person": "UtwvxzlTaCtxDmUSZNr0vnM+ynO81Ys1dOWSDxWA98Q="
								"fixed yaml":     "R4DDVljv4Mx82msxYaAbuqRqXec6dLWKcKjXfUEX0GY="
							}
							multi_step: {
								hash:       "DJK749DVNEGRAJQ0GOP7M3M5T5H4DVRIB7BSUS6DBSB48U64D6V0===="
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
