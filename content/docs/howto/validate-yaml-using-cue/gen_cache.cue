package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "78xhPdeAj8EFftC3xQa2nW8He3UAQCoXG7272zslp3U="
								"initial x.cue":  "1LU6kkciqPnSTHcxEA7UITm4JPoom2Ts+0X5stNGwl4="
								"another person": "ingXFW25pAqt1llXYntRqQTHBweOH7U1nNWhpuADzEs="
								"fixed yaml":     "ywmAAVhDAtrlJzg4oou76YljwqQrUYI5BUHSs7GbJ9c="
							}
							multi_step: {
								"EJ87F61C96IK20SCFJGI6RMTO3FJGP9QGUNRTG318AA99460T1H0====": [{
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
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
