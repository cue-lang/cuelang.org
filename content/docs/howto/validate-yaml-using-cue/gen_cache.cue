package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "EdGDAKE2L/hS4zoIukQjocP6M7ZUTgK2MxzWo4QSPrY="
								"initial x.cue":  "fsnnZ6IiSOtZ8klCVpTQ36U/cRQqA2AYHy+QXU0yOzE="
								"another person": "jg3LDHrk85J1AyRbcKfUyWMNXxMHc1cNAudMbJTaRp4="
								"fixed yaml":     "En16l7SNveoNsqevmQzWLAHL9uAKA4Za671s5N+xPyk="
							}
							multi_step: {
								"MCOMPQH9QNG1KJVDMU73EKO02F6V9P6CVT0HD6CBIA8I5SS8G89G====": [{
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
