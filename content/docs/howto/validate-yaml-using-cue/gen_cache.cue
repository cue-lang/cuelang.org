package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "34dNma3Emlx8ksOILlZUfLwK/YoQcZUjwADZk2Kl9Y0="
								"initial x.cue":  "wPUI7duyIs4bXGBxGibYvKtzcH4s9Xvxu6RPQ7ECN9g="
								"another person": "VXw4N65GhXPIkHyw6Is6tU2Nq/HM+ULavo2iNp4VAlM="
								"fixed yaml":     "ByduHzSNjN1YNPmTCrsrxgn0nL63I+pw6I0VrLdLXW4="
							}
							multi_step: {
								hash:       "J0IMVLHA5Q99BGK7MQ71R9JOAPNUO2MSNPMFFDJABCL2IQURJRMG===="
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
