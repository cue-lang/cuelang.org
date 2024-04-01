package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "0AhIg09KtyabOqr4xn2TjrFY11LZra0kQAoBWTrEMwI="
								"initial x.cue":  "/OgrBvDKn51PXo6yCtMbYTo0pWU0YXEkeXrSS6GHXBo="
								"another person": "K7wFjU+793hOTelmqJjhj6PS2OnQW+XPyWKxMo4o2Ds="
								"fixed yaml":     "Ue6x1XZV3HVYadSwKC0WJEAJHh99vxKTO4QyvLUkUN4="
							}
							multi_step: {
								"DHE3F6LBBH1RGU8RJ864EPP1NO0O9N470L0CTCVMR23P4TBRNQ30====": [{
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
