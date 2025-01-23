package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/Ftns9VewHF07Fugreayu/Nxj4nIfxVvhUxgBd/u4OU="
								"initial x.cue":  "ZS9bJ0qxU0ExzpN7WQDlFjk5Kc1hoC6HVLcCCr1hsr8="
								"another person": "9uVtdcGIiICaIrdbODd6PRofQuTQXSm3DNT8TKOrsjM="
								"fixed yaml":     "G5tOgqmeZwGSD6T5J+E2jR10pgxyhl4ykKkj7r82psM="
							}
							multi_step: {
								hash:       "5H6QUJN8UAJ73JB5I9NM7VTVF72GJ62EUEBD26OHEEPMTCHVGL1G===="
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
