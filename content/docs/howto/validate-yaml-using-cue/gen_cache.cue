package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "8Q0KufTlenunjqwtCKQ+wIlPfYunTxofnWzdPptO1ew="
								"initial x.cue":  "wWV4dSQWxSg/f8NuGvSaMWYAMryAjKHqI4Xjs0J+96w="
								"another person": "ZuOXfNBAhsmuionYUQFaBwXWbD03l58wjUExg+Dqc4Y="
								"fixed yaml":     "Y/bfirSm5DDT9gIhugadTDh4PnFvf2RNJn+g1YgQz40="
							}
							multi_step: {
								hash:       "8JHV9A818KTM322S4FR5U06TPJ3KLAQGPEVQC1EF3NFU9UC0NFG0===="
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
