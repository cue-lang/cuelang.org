package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "9To09E4nlsKxqKBZWMyxMA7Op8HJ7Jc6tcBT52VFGiU="
								"initial x.cue":  "GjjTa+ZmD2zYxNpvSBsk37QA5/LlJswgZrdWk20ovKQ="
								"another person": "WqQYPr6yIoYk3vcfBMtAUnrT55h6Ckgtfo8ztujU0PE="
								"fixed yaml":     "8duj4l/fLt52gyrB5cebzisxsuJKwrNAiFcQUNRhylw="
							}
							multi_step: {
								hash:       "RQ4E3LUI40GK7HGV49EI5KTQU8GOLBIIRKO444UR85NTGIM2AS0G===="
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
