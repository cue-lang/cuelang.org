package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "J7D6LkfNEWW9TjoOSfxtEuM9aq2pDSJQPS4DPbOgb64="
								"initial x.cue":  "ZdfoGPxrfxzDNBnJOAz5q1MWZtGLszcFj+Ftd0NIo60="
								"another person": "kKLYg9OZxz2w12Hdc4uLrFJ+d6g/P4wme8Luhi6ouw0="
								"fixed yaml":     "9pE1JyWLDuxjtTlQBquCs7g9zdO9vBqVUPJZDhe7gY4="
							}
							multi_step: {
								hash:       "BCL79C52SQA9VDUF6C61SSKHBDE7UJOUGM70ERLIH0KPATLLA5Q0===="
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
