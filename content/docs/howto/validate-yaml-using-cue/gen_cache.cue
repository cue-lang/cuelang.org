package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "W307isGuEEORUxzJpF+x48RfNBJ3DcdmiouGZDyP72M="
								"initial x.cue":  "zwa35z2vR3WwR7xUaWq9EUIu/pJBdztZfEUxxnZyUuw="
								"another person": "W03Xn/6rkrlnH5fWqGvbj4AnOpiqy6mvYM4HCeEHTbQ="
								"fixed yaml":     "KYJQ2mEl+SjIFLYk9X1Qu75fvaSXiKpTyhiBMToKD20="
							}
							multi_step: {
								hash:       "A6FJBFKR99ON2GQPPFSC4P58A408L9RHAGOQ3L8K9ISC9AHK7JA0===="
								scriptHash: "DE9VH3D0G7UR7VTKS164SH6455EO8BDDJ06SC0TH6SBBKB4RMM60===="
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
