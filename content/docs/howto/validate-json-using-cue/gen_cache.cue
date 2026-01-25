package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "jucYrn2H0an+qhFtvS4uHhGggM0fkIVjPdP5+3JjgP0="
								"x.cue":        "kdCaw0eGZoDoT1AT7Ge6n8lf0d5kGa0oozpYPx+Tnrg="
								"x.json v2":    "aHiKKuv+X5GTnq3p/0jzkLrl4Y7ww8UnoWygmQvoWQU="
								"fixed x.json": "UZVNDLFAzQ5tHKaBMmM2YPRXFhbaZLzEWhsV/5rssBw="
							}
							multi_step: {
								hash:       "1UR1RIAHL4ITOG5RVEE9T7S3786NNF0J02POS0HJKEG6F96M2TAG===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
