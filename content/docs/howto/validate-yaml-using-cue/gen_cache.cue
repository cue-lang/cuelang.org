package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "gGLaAXYlzS396uK7RfQnBPK1G9jw2Hi8fVCsl7DYmjE="
								"initial x.cue":  "H/lhB4MJzBWvHmak+ppcf3ldnq9KjMvE71g2Jt3DPFY="
								"another person": "5JKCOWxOfJtbz7Y0/Y9QoKW8hfzSV2yagf7EQw/Ocmw="
								"fixed yaml":     "0E8DAUDhnbyDwDq5As8SrD0m8In/JOd5e61mxZb4A2o="
							}
							multi_step: {
								hash:       "I5PI3TSNMGU3FUST8FIKO678LCQMODFPI5439PFPJBKG8P9KHCLG===="
								scriptHash: "FCVR3RQM9KMC4K4253KBPI107J84GMJJJ8ULKG41E4AVUBFH6UUG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:25
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
