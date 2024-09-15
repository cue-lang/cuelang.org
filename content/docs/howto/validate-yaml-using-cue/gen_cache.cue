package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "1pU5wXNRxktzxr31gJl/uXJAGDvgYs3oYyJ14NR78AM="
								"initial x.cue":  "8IQTaah3vxdqn/XLFLO8wSKxQIV7Wt8C+Xg5ODGrp+E="
								"another person": "w+MJ7hyYy4k1pGH/jshPmfktENlfEskLmAnvc5mEpCo="
								"fixed yaml":     "nfxujpKdxmlqDAOHNMjxcYb03lFO+wmBoefT/DZ+uXw="
							}
							multi_step: {
								hash:       "FPMAVD9MCUOF3O9KHL9FR3T88MISMI683OPPVRE3KBRVCRG4G550===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
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
