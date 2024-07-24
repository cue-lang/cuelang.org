package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "T8F+ToSUhG6BoZoxtY8FYX/TIePvQB3GdJmfUM9lL6g="
								"initial x.cue":  "kUvJPBQtagdH9QCgj8pKrjA3tgvbaXMrz06lBJPVewI="
								"another person": "Amo9ddQ+A12b9ZPbiFUTL5G0YE7/W0fQR0AU8nbgwQs="
								"fixed yaml":     "sO7NgB7wIpWYKE5f5yi9PV/JPsm6fZuwe6bvNU3ciRc="
							}
							multi_step: {
								hash:       "Q8CLL5JOQ0BS1E0GKQA0U0GLCRUHKO4JKPRKOCQ8JUIO4R2SNCQ0===="
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
