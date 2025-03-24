package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ieoVs1BNRvktsYcW8nV5rbx0O66ubaRYkUdgq1qkTlc="
								"initial x.cue":  "5UjtOvBkigrJZjKgdrZXdwT6oSYBbHt7uqMn0T75eUU="
								"another person": "s011qRXHI8gIkIU1Ij/tjXuA1oWOY+uvZ79C6Qgt7Dw="
								"fixed yaml":     "OM8NRdkEcowKpOPB98Jtcu/6IdNOPU1PAp7xIT0n2kI="
							}
							multi_step: {
								hash:       "KRPSHOIVRQ1GHI9N2PT638F4MUML1FQF0937CHN68RTFCNKG400G===="
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
