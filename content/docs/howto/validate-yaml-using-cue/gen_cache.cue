package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "c/R0NA1QT2K8iTXhISqvnvkZ/vHBDQckbBDYtQej7RY="
								"initial x.cue":  "tCUWw6TFXtqlvgBJHyJrgrzGYXhARO0peoKQ93PU3ks="
								"another person": "r9Bnr9o/32dWAnLZI4yWHR3yHIZ0yyc4d+CsUhFTHvI="
								"fixed yaml":     "S3ZOEdN8OeNh8VpN1e9m3WdwzV8GKOH9oHUPU3TFY4U="
							}
							multi_step: {
								hash:       "FI396FGV6NOBDLARH7BPPFUR2OJB00KKT4ET3M8JOLJK1H6TA7LG===="
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
