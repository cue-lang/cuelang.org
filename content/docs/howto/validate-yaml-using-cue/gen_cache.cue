package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "7dDnbcN8w1w7zXH4qfFZTlTheTjqT4CjwSIQmsCNfaQ="
								"initial x.cue":  "2muDRcBdSCYYjgHBZxe4eHEVQZECiwY1JocfqUEuqsA="
								"another person": "oVgXb4oyJuw3HPCp6GbZQ0pssTL3UqCnwj6XnZ8E15U="
								"fixed yaml":     "3hSijv0tqTfT34rPU4gHvxU7xkSLnbMVdQAp1gNXRg0="
							}
							multi_step: {
								"RSAQR5PPKQORLDQBC69F57008E19GQH74Q5G1K3CK8N7KMLGHKQ0====": [{
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
