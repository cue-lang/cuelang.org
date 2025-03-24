package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "eb+VfAtkOmlk2YR8E4MScC7UvjACqGBQEp9f9TnPoP0="
								"x.cue":        "C7WnXSushfgi7W8Zi3C57QEOJFwAO/D2GFzCiYB0GV0="
								"x.json v2":    "EzaKxFA3Le4cMIJgb7ZVPRJLbnc1+mTtnOqRcvloQK4="
								"fixed x.json": "Dyo6bJa72ZJ56l9vzgchh3YY8i84Q8Djn1R9TM9t/kc="
							}
							multi_step: {
								hash:       "CBQE1N2JU2D0E8DG8S8RUVNR7S8HOPPKHQ4MBRT9MCUB669LB1PG===="
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
