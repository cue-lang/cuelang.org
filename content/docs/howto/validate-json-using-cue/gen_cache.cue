package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "qWJkQkAE/jJU9XV9C9ulqSPcsvi+dHG0kRQnoy2jnTI="
								"x.cue":        "FPnEOC8O4aGMhaGuEApjTs1N7vxyy2rkxaYLzSvBBP4="
								"x.json v2":    "rIRCpC0FKfxCvBy2Jy0ySIjunUtZDsA03eRXP0MqKtw="
								"fixed x.json": "0C1PnMRREzWtyl9CWARKSUX+KiGZNUT5LS93hVfeMwk="
							}
							multi_step: {
								hash:       "401G31T0SAMUN73854SGSJ0T88C23L53FUCL7722AR86OPES86Q0===="
								scriptHash: "TSK0AHJP6EQTEE5K3ON49LP8SMSD10449MAOD1RJA91HOUOLHLDG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
