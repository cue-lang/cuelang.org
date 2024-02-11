package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "3p5TRHOK+UzMNzOvA94Wqlp2DguKloJCaCFGD4MWhCw="
								"initial x.cue":  "RKbewX+Uv8P5k48194R1MMRxmc448x4pb6iQ4WuBpU0="
								"another person": "M4YyQV7We5uD3pWnTwcqypRXfDJBZ2/jOalqR36jlK4="
								"fixed yaml":     "U7gOZKiRHgrFYlcNIjAJuxNcGG8ra5E+KvGP+PoJGX8="
							}
							multi_step: {
								"97DJ1J1ELIG80NQVR6LC859CCK3NFQQR2VCN7JAD4895KFL759RG====": [{
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
