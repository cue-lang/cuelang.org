package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "cUVebeZG8KIgYSb/nKpPq2DPIy/G2gmkVD2q9ba5xBU="
								"initial x.cue":  "EyUVAIWX++AUN14prxsyNPBI0yYsOeu6J37ukdBypgk="
								"another person": "EIVB8vvCUqcmLuH+S+K+8CGxJmyWAV5qqWmBu7selVs="
								"fixed yaml":     "jz9EWJb1bCQZjLRWs3GwIAqmsJTYPrMDbPCLo0Fu2bs="
							}
							multi_step: {
								"0VOQLUGCJSGVINN571U7OTUIB49JJQTG2PU4TU99DP7BGBSB6BI0====": [{
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
