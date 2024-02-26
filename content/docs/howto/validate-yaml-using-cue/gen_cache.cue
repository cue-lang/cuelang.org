package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "mLEyaYDkjHEpg7FAdW6uQjTANLn3BQOT3mbTEOqxd7A="
								"initial x.cue":  "fe3+DV61fpjcrvu7WwaZizbS4trzxjJwxrXYUWVvZy0="
								"another person": "uI+spBesxL6oyEPRnpgeTKIxwsHSSpJXLrcXyW8xQp4="
								"fixed yaml":     "CJRErLIQl/u9ocwFZvN2IQHafJzAmBIxZoHpHF7/6No="
							}
							multi_step: {
								"O0KS7KVNE9TP81ADA161OOQPIRE4I75LEJTMDN9G9JSCTKIRA4GG====": [{
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
