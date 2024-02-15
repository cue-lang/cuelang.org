package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "idLh+8RW8DFXH1sk1Y5Z/+p04kwohWJE56raBEVwcV8="
								"initial x.cue":  "KCYZ0cC7UdOkgRn12ln3KTFsTQgfJQ7yG3kn8VyhiXw="
								"another person": "9cLu8k5AsRuSfrvHyIg8MHL2ytNE2NZ/TS1APlj9+ZI="
								"fixed yaml":     "ATm04/vGhJZ9nJwyxhoI3qSGA/V4c9Qog1TsFIPRkmA="
							}
							multi_step: {
								"DGO2FHMOL2MV74B24H3DVGLC46IN9IFQD4SP508J5OE2JSIEDMMG====": [{
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
