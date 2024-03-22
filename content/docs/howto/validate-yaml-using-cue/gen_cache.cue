package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "SF5pfkqv2o8DhEKfj4xafl0WgeD99kR6wT89raukzSU="
								"initial x.cue":  "UotJVbHfYpSpkko87qeB41c3MyolEg/UVhUBnN6tMfc="
								"another person": "QO774AYAzX2KtjdEH7UXackLdVWTTh6F7z2wlscttPs="
								"fixed yaml":     "15nonxM+DRkeYsQ7XIy8yzhT0nvWM9Z1ohQty1gimXo="
							}
							multi_step: {
								"5VCRF4E500G6SOA45IUT7F1I39MALU42HO982BCVB0J4RSSQORL0====": [{
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
