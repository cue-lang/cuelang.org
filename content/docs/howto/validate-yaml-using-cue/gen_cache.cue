package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "9TllXNxMBbtjJu3VUf7muaUZ/NGbduRGqtQBLni9mBQ="
								"initial x.cue":  "g2MSiB80Vard0t3WlLjMeJ8ZrcZaaQQw9rs0d+iVnH0="
								"another person": "dajW5QL7iVE5GreJL8RRY1r4yWPIWKu+sCJ90rdrDi4="
								"fixed yaml":     "JnhOCqMkcM5eSe1n8GdhnqHJJWPIFw1A89XSGOgbMEQ="
							}
							multi_step: {
								hash:       "DRL8EKD23F4816H2SIH3RNCPAFFC8SDITBGTNC8A0ASPSG25A1BG===="
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
