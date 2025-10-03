package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "RC0X0XNRy6+WDhPXrP3nduKI9MAHJryuRO9f6JAmMG8="
								"x.cue":        "DW9jFXcImdOiKV1eYXGyfRMctmj28TNLEq9Ahl2Ouk0="
								"x.json v2":    "SwQf9ykN2WEpP4k/ssU6d/nuZgNiLsCICOl2oSDbebM="
								"fixed x.json": "C2NTQdKD6kpHk5mMfGsdmqxKHl+LnXaxqpcZBcFkbl8="
							}
							multi_step: {
								hash:       "B31TFFS21HEL15PC19QFRLBNO5P8AFA29J8QIKL826IUMAQL4KH0===="
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
