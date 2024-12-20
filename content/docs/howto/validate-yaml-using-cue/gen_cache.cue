package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "FHz+EIxVhkZRekLU0ZSiSzvMWnLcssd60hOWzCS5v2o="
								"initial x.cue":  "aqxCKuPbk9AIVJLckUuC4J2f5N5HjuMORe5KwSLhKVw="
								"another person": "Va1TJPp2hqvqa1jZ2ml6LFlDo4nFE394XaMcxlSY47k="
								"fixed yaml":     "ByjaZJBbs7HJ5zOm0qwp6+K1Pq65eQn0m64W4uRdbUo="
							}
							multi_step: {
								hash:       "O338RPCTS4JE7R40I3OGSS7A09GLVI2E79UMS9MP8VF7P3THVB40===="
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
