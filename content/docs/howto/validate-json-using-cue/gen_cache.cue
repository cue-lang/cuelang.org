package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "7eW+Qhin6h3MvcbwcPHsM6trrVvsD5m1KI8rSA5qvIg="
								"x.cue":        "oxqjvz2LlAURjHePOf9KDs059tWo1DzQdHU2U9CXAD0="
								"x.json v2":    "WgdSBeeCF8nKO/cuysewF7mVFA9loKlIRP1t5jaGMNE="
								"fixed x.json": "CpCrKRHb7pgM9jXrWWONcB10yE5dqCXX3+QRqoBez/8="
							}
							multi_step: {
								hash:       "PMEV5PRH0AJI6CTQKNDGRNK0ELBE8K9B5EVQQGJK0ICV1V1TG370===="
								scriptHash: "AAA3CVDQRKSCMFV7CUP90CM199MG6USVJE9DE2KGITAA48SRPHGG===="
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
											    ./x.cue:7:25
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
