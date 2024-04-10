package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "W7wgEzsprvQ+ABF3HtqUF/DA/QvCTG39OtjWCE1bo7I="
								"initial x.cue":  "4bIGElVtdBOBWjVxpV4VHp6KmdAM4GyAH+OhQKRsF1I="
								"another person": "7TNnlPzzOS2BzIM9sDBbdIUiecVTngs2yx7oOm2HLQM="
								"fixed yaml":     "8llbKMxYvdJGOzUSaI722KYY44UFFt/vd9Nunsced0U="
							}
							multi_step: {
								hash:       "VOGILF1V90JHIAL3CFPJ0IBSA8LORUB8U1L9P1BORU8D1Q33RB20===="
								scriptHash: "DE9VH3D0G7UR7VTKS164SH6455EO8BDDJ06SC0TH6SBBKB4RMM60===="
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
