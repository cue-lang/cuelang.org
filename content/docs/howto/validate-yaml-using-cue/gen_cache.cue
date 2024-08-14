package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/1UNDZgd/dbEyVRkQeaR+6HjUo0h6Qh7qk+zz8TNSWI="
								"initial x.cue":  "IwMUUPjbIn3Fgz+PbYa9CxDF1Sx1YiO8pUixEsaklDo="
								"another person": "w5Jk2sOsJEzuGOQ65pykYGafXQfobjoYcrVfYFGRmMA="
								"fixed yaml":     "TWzmSQCgNqVJwIYzQKXSdkSWq1rAslN98b87RpxTfaY="
							}
							multi_step: {
								hash:       "A85I7A07LHJS1K0EMEU8M5FJOOTSU4C15252SBFA5V8P5QS367CG===="
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
