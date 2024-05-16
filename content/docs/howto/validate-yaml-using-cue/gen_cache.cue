package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "4LWoYf8Cki2EH6+XOUCPgDeVf0g1T/7V4+n8ftM/MgE="
								"initial x.cue":  "vQbJXXjTEouyhudhE9zYWnJaPY9FIi6zG6/K2mowz+k="
								"another person": "7p/9DGomp3sDRVsW8I+8Ro191gzFsCUFXAcmKi9joGo="
								"fixed yaml":     "XRIPP3M1URVOjuc5kviHNCXUm6yNOhmESmX/7VLEmm8="
							}
							multi_step: {
								hash:       "47T2NVI43KKL6EEBOE50R897PV8FQFP8F4J8F12ADE6LFAHHDQDG===="
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
