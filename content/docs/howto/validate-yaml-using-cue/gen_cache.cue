package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "1sRr2AhL4FVEl3hpWP/5sovlRt5PdyKpmiczGDvNQNw="
								"initial x.cue":  "UNJ0USnuGsWlJpnLMm2qDJ2Utkr7uffXheNE/uf3qCs="
								"another person": "5NRp/39jP0BWLtilzS/jMFTtEIGo6jPsCLSExx03zGM="
								"fixed yaml":     "ChUwqu4hRuwCOpb+tV1ielEqMfKHNaXBqIdiB2BXMgQ="
							}
							multi_step: {
								hash:       "51MPANOFULRKT4IA51QAHDETULCJJUA7573T6V2AJN6LSFRCT6VG===="
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
