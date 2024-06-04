package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "RYHycKTz/GofJsauVzZf8QCYybJQiSrSSa6Oll7Bwq0="
								"initial x.cue":  "erVvOhXugxTOJFjng6mFnX1utLA14ypp5nfxg1iiWX8="
								"another person": "z/WHyzCAnz5ej+BPPMcLELOz8NVODlF4FByuWeR6nKM="
								"fixed yaml":     "O1VwPgN1Sd+WhOfEeZUnUPv+1g9poYESI3qh2zdrT+A="
							}
							multi_step: {
								hash:       "BD0U63S4NAR6QA7V9EM9A8MM5FA8IC5OD075DGR4GQ6333G84R00===="
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
