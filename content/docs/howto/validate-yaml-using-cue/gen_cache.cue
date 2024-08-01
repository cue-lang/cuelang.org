package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "W5kdn9XaQ9jIwC3vBy5cs3QWjep4wLJBb0Sy5OKNhE0="
								"initial x.cue":  "DzJOZIccXmDTl+DbBi4ucdsayyg5Bla5HjxkNFtO6sg="
								"another person": "+UiEG/Ll6jCE2OZiDsTCVCjfQL4a7bj7LVA6OXIo39Q="
								"fixed yaml":     "nNSjq7X35ottFk6ovqhIza/TKJummwn2EnJ+If8QuB8="
							}
							multi_step: {
								hash:       "IHQV9FFJUTB82AVB0DNE2AUQJFOUS1CJ903CVNNFM7SGJVS7SPLG===="
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
