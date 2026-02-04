package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "KbyjnLtd6o8Mkt4SDAa4+b/ypMHaESyG8bWCXfrwIgc="
								"x.cue":        "ABt2wVrSvsSj45ZvqE7xQ5HzZtO3VI04H4JbV99BEJI="
								"x.json v2":    "PIKxTDgLnB6yRBypOwn8Ws48FnAYiXRZaUSJaaA2UQI="
								"fixed x.json": "JzoKJjFdXLSTjE5MDlrWZysk70QJhjFfogOka4WrZow="
							}
							multi_step: {
								hash:       "1EMI998C5F3OVK0BL5EI0FI1VOSS6USMCSGINFPA77BQNHS9OOD0===="
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
											    ./x.cue:7:21
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
