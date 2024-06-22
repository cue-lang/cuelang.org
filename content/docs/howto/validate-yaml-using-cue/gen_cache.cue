package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "pWV91yVQ30bPlgVhaXV8gb/A5WAfSNuQtTxeC3xMQ3U="
								"initial x.cue":  "370hDRv7BQNRYTIvXDQ+7xG3zASqc75PTpwah9LWWSc="
								"another person": "GGhFxO04omIgUSacCs9K2/IxK0jGVn0qga6v+vRq01o="
								"fixed yaml":     "u/aFTLdrRkEiPXtrEGKEBVRFt68nJ4yCvEXFRqFVMGY="
							}
							multi_step: {
								hash:       "CRHB8OCHMOSHUMKQN6IB1EV8M7F27KKRS9OF7481GP5Q0FRPMOT0===="
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
