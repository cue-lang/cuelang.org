package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "JlqdP890smih58OpBB5AZFFpDgrjmzQerZ7It80V8gE="
								"initial x.cue":  "ouP+H62grdtEezrhLguiL/fwMJ98z5IDYfu4HJyhon0="
								"another person": "WxYx9RB2rBB8vSt7eb8z7blUgxvkSE8VmW2LtJ0bfH0="
								"fixed yaml":     "OCqDgdTrnc0lyHoGyr2nFvY7UOnZ3z8CzpFuNk8RCmc="
							}
							multi_step: {
								hash:       "NATJU1CB423IHHP02UBAOHUOTHK52RL10USUH4KMAGRSKCQIJ8A0===="
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
