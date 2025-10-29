package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "7cB+PqOPGn4XpJ8fM5v1uB++GRAqxdJZr8F8BHcO40Y="
								"x.cue":        "jO4JTYPMo4oabYTyM3lQo5gB6Cgi2lroXvEG6OKNHKI="
								"x.json v2":    "DKa3QRKViCuu5h76b0adE3qAuMUTvl/WY6Lw5G/DZTY="
								"fixed x.json": "OSSo9ihfXmvoj3lgAD/b2hkmOg4IXlRT2AvgWzQ2Zk4="
							}
							multi_step: {
								hash:       "16ACNCQDGUCRPJCLDTAI1QSOAL2NRC3GCS8JJQUGQI70RJLCS1T0===="
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
