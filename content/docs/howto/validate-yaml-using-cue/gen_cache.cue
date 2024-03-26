package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "115qrbky4z6EPjiLCpFZvgcYN6onpf9OeGZOR2Xwl+0="
								"initial x.cue":  "QN3pdO7TdZkdOkcpjW4yD1DrgsfLcCY7yzgUYEUcWnE="
								"another person": "fsiNPgbq6Tvj2yS7EB7uzSoYlcwnwcfxVlF4HguCpw8="
								"fixed yaml":     "kBiCOr7LKSWbcpE/Ozj4AChrPSTtOJvMJWj+rWnT5CU="
							}
							multi_step: {
								"2N5DC4OGIQIH89E6S622LC33N9QGMMKJM8AMDAIVE7AA229GCGJ0====": [{
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
