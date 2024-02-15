package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "lHgM3fve7YELy4H+MISb4whZxIFGYwJWw+XpZiyh+3k="
								"initial x.cue":  "bsUcwhY6Tf4Br8DXSr4KVM/L2pNuxFRTaM6rTNWNJrE="
								"another person": "Qi7FRbvuDmHZMX5bYaXrqJ5n559loenlxZQ4C2vC7nA="
								"fixed yaml":     "uX+oxkUkCqSpoQOvgcUGa1Zt8DBKoO+KjdNJGSh2uPc="
							}
							multi_step: {
								"4QITECILJS37A8AL623HRUR7AVH2FUP4KN0O6QBUFVAL3KB7SAQ0====": [{
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
