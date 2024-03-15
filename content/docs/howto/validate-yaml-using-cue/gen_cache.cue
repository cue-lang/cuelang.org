package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "rrsC3PDxtStt3qua+Bowb0mDxbeHfZ+ZzyVgEHJ6mLg="
								"initial x.cue":  "SXK0rGmYtyaWGwR37dRFjx1ydMn3OdDyvJaSZH/MO1w="
								"another person": "C91GOF70o2ioNUcY9hPqWGUkQg/J/QMv9zkh1h2D13U="
								"fixed yaml":     "QoLHCMuQhoXBiJ5lGKvg1hIXryGqWYw8PeqjCQ4XV9M="
							}
							multi_step: {
								"GP6NU96MRT9QQDACHQT7D2VJ2JERA64I8CBMBAG5CTBNB3OST9PG====": [{
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
