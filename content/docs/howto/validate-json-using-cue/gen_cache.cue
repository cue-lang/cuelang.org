package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "YC2sj+kG/ouhFtaWrRxv9tM0M95I+vincmiUgJsaMTo="
								"x.cue":        "ANmBMq2IzckiDvmr6frdafQV8bqRy5FpDpeP4weghuk="
								"x.json v2":    "KU5rY5EUXN9nU71bpmMeGRmjIQKCsrrxGSvAYamKamY="
								"fixed x.json": "mlrH4TgM8CMM/5qhXt18+oj/YyHOjH/2gw8jmCJ0Nw8="
							}
							multi_step: {
								hash:       "7E8DQ4ITE8FQEDKGU9KO6ET8NTGR6U87HS609VTVDT2RJOMORU3G===="
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
