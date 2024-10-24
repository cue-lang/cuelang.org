package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "I30tAksV5BFz/xeHuljysMIvH+MQnomCQL273HOJsRc="
								"initial x.cue":  "WQZI3ARmL0wlO9DDgGTnJ+XSGyq+KpCY901xwsv5KyU="
								"another person": "dCaxQUUrj2Is7IzZJu4NmUw7opLQtnrJ32e2mCuQNAI="
								"fixed yaml":     "tvMS9KHQ+1X5mwcGv8hOlhfyyyujLHP0FYfrjQfXOIU="
							}
							multi_step: {
								hash:       "G9PGFPR29JN708IGP5N8NQVV8JNEV4OG0518MH44KHUN44140EKG===="
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
