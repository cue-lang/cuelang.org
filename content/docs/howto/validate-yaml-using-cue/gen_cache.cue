package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "rEYjjcUYWwogdxjQx8BLaB1lsRPTHl42Lded1KHGAJM="
								"initial x.cue":  "yEv25xfGOiVilMVeT1iF5tCqm49xHt8OABxliu/ZacY="
								"another person": "Uhqn2L5pNSF+JQFbAJyMsSl9Fho0rw2HEMZ52veGCkY="
								"fixed yaml":     "RSNbAO/uXkrg2ZoIw2bkxzu1yGDh5O1KpW7rBuLyw98="
							}
							multi_step: {
								hash:       "8UE0BGOSISOO3MKRCI58ISN81PKKNJ12MUOG40EIOPJA1BJ3I3JG===="
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
