package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "oTEvvy7BT9WWa1YNn8kc7mVb+WkJQYANC+OkXhp1kuY="
								"initial x.cue":  "7ag3Ivkzwtm4J4/TS6AbyllQZEiQDhnCiq6rffrh2wg="
								"another person": "j9EtFQTnCIpU7o8CC8D0T4p+CuHLyuq6jT7KQXBWaYk="
								"fixed yaml":     "s/1WAVZw/RBTqYVe0iq++P7tNDH5p5bL4a57JX+//Z8="
							}
							multi_step: {
								"VV18OOD65GLR84P1V1E63AU51DOMTNMAN8S4A2TT8JUPL02INQ90====": [{
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
