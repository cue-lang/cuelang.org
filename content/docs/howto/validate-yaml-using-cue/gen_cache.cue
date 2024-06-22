package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "CSSbPATLg/9IaxCkH7sYZRO5KfU98R+7CZT/l64fHY4="
								"initial x.cue":  "EJ802iLmAji7JIRXOFSUEn/zRCmceEI6wIcK/5vYb9o="
								"another person": "IbUk1uEdAg5pLFw7xXmoszs+swezXH3G2yDzWdQz55I="
								"fixed yaml":     "dzQDpVw6vap3A5FpaX1ZQEVQHUz7XDHSOoEfBr5QMvk="
							}
							multi_step: {
								hash:       "74LBRUKAO0POKUGSOBO60J4CUT4P3RFJV2VB3VGEUNV929PK1I30===="
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
