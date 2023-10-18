package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "q7XBRQepQjEb7CcwlmpzjLg/pmnECJcbV/bQPTtTmqE="
								"initial x.cue":  "8a4YkntNYtO4quNfowTogSOcdgkSHKFIgN2oL9eCcnE="
								"another person": "e+nkAOA5ICu5AD46uDPWr7hSgYEhZwVf15h1UZww/Vk="
								"fixed yaml":     "pv4lYid6eubAk+/a1jo1oEwivHliAQeVXexkueJV+ho="
							}
							multi_step: {
								"8G0KVLTK25DQKO59P062OGCI4COFNOR12R9FG62H41MONNB634Q0====": [{
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
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
