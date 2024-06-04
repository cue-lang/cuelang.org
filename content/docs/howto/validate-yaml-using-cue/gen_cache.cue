package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "q9Diz/hgm51EkQEjRpUh/iT/++ikGe1uMmOUTrnma/4="
								"initial x.cue":  "3exPWTtxF407dVHyAr9M7qEMXbAgOZgBdkBkV6oXkS0="
								"another person": "6VRdItg39bzh/03imCkmt20w1yKP9XWK5nOpLT21yWM="
								"fixed yaml":     "dc2U6DjTN3ATfmzBZRS93t5GfXdh+phOxx/4PZXsPog="
							}
							multi_step: {
								hash:       "ICKPRH7F6FODP1OHE5SL5FOEEMNCA236AM2J61C7UKCNC5GPJ3QG===="
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
