package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "aQKIvZhr2Ukw/EMF29s/pni4C2zgzG75yS1nwATPBTY="
								"initial x.cue":  "FKikic3CJXJXrbaHjbZIcYX3HRxEuu7NBnFjN4751Q8="
								"another person": "Y5P4p2fNTRH9DBs2LH7dCvvqhNpfa1MOC7CpUicaY+0="
								"fixed yaml":     "9pw4thPrpPZWSSSB2eIG39WX/5TJc+5cUu4gdK0VV8o="
							}
							multi_step: {
								"T837HT04F5EENC832FT6RREPJGA8JB7RIOSNV9LQPJR6EVI56510====": [{
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
