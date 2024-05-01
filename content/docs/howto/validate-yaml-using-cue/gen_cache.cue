package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "2mR4GSmfQr1Qun3H69pmJWjWIHuSHkLMxHK6l1WKp9o="
								"initial x.cue":  "/1GDNqJjzF3mcxpAfB3xyJ0E0q1cc3MGcR2U224lUz4="
								"another person": "7jQaA2pkIGMvYteQm4CwfuySyPmKkhfpKxQUxb2OJac="
								"fixed yaml":     "SlzmGY8kuolfEJ9IbreRAEqT2HKbDgjIoa9QuB7ZDYw="
							}
							multi_step: {
								hash:       "798FA59R2G9KH2LDPC9E4J4BB6U65BCR5HRFR9NIJJH6E2985FT0===="
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
