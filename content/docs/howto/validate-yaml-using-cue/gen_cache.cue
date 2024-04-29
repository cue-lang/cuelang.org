package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "AS6CiSg6ll9W+y6NSmjZaoWuHccZgHq5vD7JOfhKd4g="
								"initial x.cue":  "u5vAW+JNihJuq+DAHRuhwPLiipZkw7ZaS8hgWRhUeKg="
								"another person": "mrcxwTYAFXNWbwLQl4tjHqDTicCsH0P/zKEaFvQ962M="
								"fixed yaml":     "uHLCGoXfhuKebitdFHc9YlodBG7gIkQo67os5B9xRnE="
							}
							multi_step: {
								hash:       "AJSTLOR6GNT5OLP39M75N80D2TQTF1D1752URQ1I0GCQ6SUO9BR0===="
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
