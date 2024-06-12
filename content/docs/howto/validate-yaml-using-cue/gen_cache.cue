package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "OZCI2lXuLDQJobq3+HDh/ub3RHefccHU/WrIWjQgaI4="
								"initial x.cue":  "E9LOvOQdQNDV2+gmn/2g/wFNIl5Ueb/2ZQZd46jhkPQ="
								"another person": "mJLJ2yb65aWlQ3d0unyOHcIQ0QVq4Q2+YsCWcI7MZ+s="
								"fixed yaml":     "OafZQRu1qpKYFne9OxMlr5W9PVGUHjLk1abLYqh5pnI="
							}
							multi_step: {
								hash:       "51DLA1VUK9QMQQ99B477IMQ9JJUP4HKECF9Q75GI7NGPIQ36CNEG===="
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
