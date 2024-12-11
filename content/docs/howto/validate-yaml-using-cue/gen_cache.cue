package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "8zFifYMwdqDqyzDcpJlF0yVLkpmf0+1yqgwHTp7RL4o="
								"initial x.cue":  "DTBNVmv3NNDT8uSyqyfeoNku8dQ89D++s5vq6u6pGjM="
								"another person": "tKhEWU4U5op8bX9bNUTbz7njKkKOyHe0u3a+814K+BQ="
								"fixed yaml":     "QCqAvkaPLwSWRbo+XCFjHPzfNMKpOorWA83DXr1Exx4="
							}
							multi_step: {
								hash:       "IITS324HS2TGLBFRKVSQPQOH1GGC0TLG12C0CLQ4JG9LDC4UCLG0===="
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
