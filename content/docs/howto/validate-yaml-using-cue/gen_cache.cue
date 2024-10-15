package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "7NkI4lvLrtbpWTiAdTJIX1MbzlRFuItwgqsTZbLPTgs="
								"initial x.cue":  "1mFreKLE/yWzmGloQPGCnZdLsMPuMUmtYK7Z8e1a4dI="
								"another person": "7xwsUKZPJW8hm6GoHYbN7n0wdrBTIRh5yyA05MsDQyA="
								"fixed yaml":     "SEc8BxGJSLJ8puY3ydH86uZpPR0+wdu4LDLjLOUYHnc="
							}
							multi_step: {
								hash:       "EKU1PN6TE6DNS4NE2K9L2O0NGL5KQ7MA081CFET85LDS9RQE7UH0===="
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
