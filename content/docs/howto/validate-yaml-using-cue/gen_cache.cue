package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "qcazlnHaT8HQMHbtcIrlUYi5V+uvGqmJi+zerW7wLTs="
								"initial x.cue":  "fA1c7mU5qi4mfvHutxJY+H68r8fHEQEyGn0YsvHke3c="
								"another person": "PSEslGX2yrKtdSms/dg664A7ZymGWud5TCiU3E5DCaY="
								"fixed yaml":     "NMHY4UhYL+fWSCPNx3rEmXx0AZ8vS+HcHpq8CEYmKMg="
							}
							multi_step: {
								"APS5VKBBOMQ9N32E1JFVERV6LFI8AE12OP213UTJBUO189KHEA4G====": [{
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
