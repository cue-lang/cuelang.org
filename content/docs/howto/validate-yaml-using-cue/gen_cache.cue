package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "t8e/WVyED9708jPXYaCGTBJ4/gg2GyQAg8G9HWkzIjg="
								"initial x.cue":  "AI7i9EqFMHqzH6e4jJMcEytryB4bKrsjM2vrBSxxkVY="
								"another person": "p8iqIJWtN3eCLl5qDCJoZtSDb+XmMivbbJneurly/QA="
								"fixed yaml":     "NBdrGKkXhSHFmdTNP4+/YveFdQUj2AfDrBu//w3UbBc="
							}
							multi_step: {
								hash:       "G6ORP4ARG431MPFNOI8V898B4RU7GQMOQK338DFND5PRJ737JSFG===="
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
