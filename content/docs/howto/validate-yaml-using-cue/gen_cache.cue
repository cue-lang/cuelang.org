package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "AMqU0pV5IwHMrSlWZzIByHTEFPLPQrBZQM7Z9nxsrz4="
								"initial x.cue":  "9ssH0O+vkr+LDiIKMaF24H3PldiTlU36D+l8dR3sJCY="
								"another person": "URIMmfo/0ISeygULeI2zd6Zto8GKuFWgZO+46r0ng4A="
								"fixed yaml":     "br5PdmB4rnrOQsMNQPHFWbjso0HwrHcgl4zERcwHn3E="
							}
							multi_step: {
								"1KJ03A28F2FPB451TQ968J6QIF56QK3QILV1HK1GQPANS8MPGO80====": [{
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
