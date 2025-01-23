package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "p1B9fNbQctcjrYJjp+wd5W91JBBn7U3eTyv+5Es1fnk="
								"initial x.cue":  "w1YQKj1YToisK35w90Xwf4M2V4RrqvigEBcVWRryQrI="
								"another person": "mBzkh5WCVzSYmVaa0mOOTjMzVRJ0ibLCC99VaAfbQ5k="
								"fixed yaml":     "AvuZ+oUWs1ef12E1JaVeT3DUycPygenDqiyjykPpmJM="
							}
							multi_step: {
								hash:       "1GDUS6TT2AU4CP9KEHLLRK9VJ9K7FDA1O0MNGRPRUQ4N58UFJVHG===="
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
