package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "2aoAcCO21wIlkf2wxqrpZSc7IhHi8e4KEZtVqsA7XVQ="
								"initial x.cue":  "AOGpbuxg4mXrTky80yweUVhrNuCoFL52OLO1WNDRuJI="
								"another person": "STMJu6eveDeopF1xOZZqyWbclLgigX4UO4wU9gG/5/4="
								"fixed yaml":     "n8F4YfJ8EM2PL+Ra7Imo2CWuCEjIi/ecSMkZR8NE0gU="
							}
							multi_step: {
								"448H518AG0D9AG8JNE8ETTV6NR0I60HJ4TC7AJCH3EHVMJMISSF0====": [{
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
