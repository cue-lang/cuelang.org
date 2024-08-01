package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "7b9ykettYJeqdjofN75ER52ylLCcIqJ/30S9WynVgv4="
								"initial x.cue":  "Ttzm/X7XtJ6Bqj91Vrjh1QBYxA9EfcYnuGCNjeTfoeE="
								"another person": "QYx7Pk/OvG8bktGkZtxbXviwZNLNdjE9RFnXcrRUTN0="
								"fixed yaml":     "YvnfWDg14GUtF1it1GznDvIQMILQ4+SJbqlWL4/AiYE="
							}
							multi_step: {
								hash:       "HSF8UNMH360Q3PKCDEF74RHKMKODRPD8TMFMN63IE1HN00U4H4Q0===="
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
