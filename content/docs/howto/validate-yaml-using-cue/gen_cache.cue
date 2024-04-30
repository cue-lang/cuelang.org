package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ZELvmZ2nfrBeMa3lVlujs2jT7MoTYX8TP7O0DM1DQZg="
								"initial x.cue":  "ykDwcnfbhoaJab0tLGU6f3C2ONzlEtVYIawYehII/yA="
								"another person": "AJx1bmtpxFuIgQGght9QqUuiMy7H6WUkE0o+bDeOZjI="
								"fixed yaml":     "EgffX/d6g2msZgER7d0MSRaHyNm1MT23kOBTYb9OZac="
							}
							multi_step: {
								hash:       "FG7PU9IE6OTOTFR8RI2IA43S936T6EJ2N00LMJP5R9J8P7RS3MMG===="
								scriptHash: "MS7QI5CA4MVPOEILI6PSQGOI1E6Q76CNVBA6KLCI09TQ6CVC1ODG===="
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
