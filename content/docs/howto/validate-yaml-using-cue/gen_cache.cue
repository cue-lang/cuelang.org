package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "PWfQNtiEEJgj/lyeFL16nb1J+UHQ3zdShTJjrXjaNRc="
								"initial x.cue":  "Z4EEQRxWZXG0ZpEIVsgR1MT+UxiVCGxhD4PdrX2xqm8="
								"another person": "OTxbwzJn4DfLfUqao7K/7beudXsYuwWamr8X7ytLe90="
								"fixed yaml":     "CQ/ukkndQC8AQ/HvLVl3KymNAveuw8chGT7FK56mh8w="
							}
							multi_step: {
								hash:       "IIO4CSA5MQMJHRL08N96HS8AE8LT3J6KSH7K303EM9TDFV4M1230===="
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
