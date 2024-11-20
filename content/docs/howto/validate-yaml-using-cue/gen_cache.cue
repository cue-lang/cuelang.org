package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "k3oQmVblinqoKuGMwCoeBA9E0bOHwRCBbSud1rkx3nU="
								"initial x.cue":  "qHzl7hTZAI0LZAF0ta55LqoYv50ZLiD7rVwUkHrvMGU="
								"another person": "PsRiOQjnZs9NEITYB9ddoTVOs+qzGCTidXC/MM75ezY="
								"fixed yaml":     "IuiJp3HwfUaedMAAR+OPoqEqXC7ubUxJo59AMIzH87A="
							}
							multi_step: {
								hash:       "2C70NVRTG59FSL69FH1CC195H0S73MBKOQ5HRV5U9U35P6168CU0===="
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
