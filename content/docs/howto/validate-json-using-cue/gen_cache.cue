package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "5fEvtVzcI3HV0Ndca9KxlrIZV4Ob3S8Qo2bx+wTZ2mY="
								"x.cue":        "UNCDz/KJG9c2ICpVgPfFduML9L9CZedcpsGeceactFY="
								"x.json v2":    "mISw4MQhGFJFFj1Hqerni4pz8wc9cC4FyBpKitYLYvw="
								"fixed x.json": "G8lVEDc0d++j+UmsoilFNoZkhOZqUZkNsZF3iQhNQ58="
							}
							multi_step: {
								hash:       "QFPGGIQNN1COBRB3P46R14RQAG1P9EGKD9Q8V1B8DSBKSIV64UN0===="
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
											    ./x.cue:7:21
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
