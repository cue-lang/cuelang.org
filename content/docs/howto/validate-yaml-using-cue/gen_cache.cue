package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Svg30O9Hfrn9hbYsDHQkahCXKod5kMGRBefXdRAO/MU="
								"initial x.cue":  "xeoNcZPkEchMbW7R7UgSWqsetbsdgkYNoVfQ1CFI5RE="
								"another person": "E37FjS/vvPA1z2FVN2j1DLiHHiwOqwSgFSTuLvcVlwY="
								"fixed yaml":     "1TnKlQ60Ge9X+Ec1I0rC+FifwDAUzvuhqBONiTPiBc4="
							}
							multi_step: {
								hash:       "08D7PJU0I9E51GFQ5Q09PL1LTS30J1H9IJEPQD7ENAF8O797FNHG===="
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
