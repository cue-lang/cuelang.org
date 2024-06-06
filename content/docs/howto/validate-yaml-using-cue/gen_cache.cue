package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "uyYZVItmU+SJBNjismWcqZGOBV5jzQEFUuuTmGY4jH0="
								"initial x.cue":  "1gEte9k3+8my/yNQGYM+5UWc9O3Bprg/xuWgGwURDjs="
								"another person": "YnBTfglPYbGjuZIKlLCzZaZ00EbV7/iLXhz/7xYcPIg="
								"fixed yaml":     "BIvEKjSVPp4/Kasq4swx5Xu6dqrzN1Z5I5Gcleq71eM="
							}
							multi_step: {
								hash:       "R8KDPL50Q7QFFL9161FV0EM525U27V3Q1BNNJJTFJ2D7NAR4F4NG===="
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
