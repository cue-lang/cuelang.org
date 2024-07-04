package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "qF1KMk4JD37BTbpL09daGHlJk9rk1RgxCy2483ct7Ts="
								"initial x.cue":  "eVqmP/mwczDlwdEYBfcgnqI0ajhOCvGIc57fIDFH+SY="
								"another person": "lIUF6VIF3gFyQO8VwRZ79nQe6MijB2ggb39UCk8xJ2A="
								"fixed yaml":     "MUpnYbTLY+az5jP2re0fpGdITLUFDmdy1Gid64jNEUc="
							}
							multi_step: {
								hash:       "5SOAHL56OQM3KFSP3JI9K9H1RSTHU58O9UN1T231N0T0MLPQ8PJ0===="
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
