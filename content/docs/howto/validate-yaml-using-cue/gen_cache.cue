package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/O7YJUhunCwyxHJ+d48DzZIwDoErUK8VwqdgBXIRn1I="
								"initial x.cue":  "Vi3fRf5DlggOuVyjdI9S5t8OScvJkI8EKEmn3SijSZ8="
								"another person": "w1u0pFN3obYRgLJaVWHjhEbYAHhOyeMbqItiyduCrEE="
								"fixed yaml":     "s5oXiCbkxgEasTd9rMVnEjIko5AjD0CwPQAukhrh14Q="
							}
							multi_step: {
								hash:       "G2I45SPCIQ9D3AT0SND4ORFIMH45O4CNU227PCTGOH71ECB5LB60===="
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
