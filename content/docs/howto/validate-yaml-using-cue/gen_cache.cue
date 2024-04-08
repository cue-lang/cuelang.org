package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "BfCqAE0/IrlI3/tIdH6nCSH7zaelyUEBXqXxBuem7xk="
								"initial x.cue":  "yhdMYjV6HVF5s4w6XwDZGpnYeXVeSz+LRWsZ++OJ7dc="
								"another person": "8hV8OtXG+Quv5RjWHcuFTWKRRRVVOoIIVTwdoxXOaCs="
								"fixed yaml":     "QcRs2YZXcmjzECcGWMVnkARefYE7JcH1dkpVFmQgNMg="
							}
							multi_step: {
								"0TK54JILK6OG62EBJ6G51TMRVJJ9EHQSLH2D4F19RP7FJ7HNHIE0====": [{
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
