package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "u3G1PP7RjJ9vUbd4Q3S5L/5ncgl+jVVhbDfz68kCkO4="
								"initial x.cue":  "yg453HGYKE8nC70AS6rfLpTR2sMcpvbFTXUzCeeToY4="
								"another person": "DGNPz9w+vfh5bQvgZjpHi0n1CcHMBaim+dGCf7eElOQ="
								"fixed yaml":     "Lg8g0PCesdnZ9AZb/gjzf7tFFzlq4wtPV7HJUioOuv0="
							}
							multi_step: {
								"VTJ35QAK3QLUVT0TTJ7PMA7BUI01KJS6BAI7NL963MJMGU55F3TG====": [{
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
