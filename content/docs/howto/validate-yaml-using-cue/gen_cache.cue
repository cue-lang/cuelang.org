package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "V6GmyvVeafS5VcT40nWXFTJ1Hl+Xa5gJHLf5WxJpsZg="
								"initial x.cue":  "F00jF4Y4SzChS7bJb0uWlM2X4aa57AP1goaTUyN/HU4="
								"another person": "H6vaTyW8WRtBoftdISgfs1keA0wSzJKpdjsgqDUfY4U="
								"fixed yaml":     "/pDkl0/nBbOwNAyYta06llVKg6Ue39pAriIFLqXowr4="
							}
							multi_step: {
								hash:       "SHN7Q8QGRDRTVLESIFHUI51B0N83A2MNSEK34IQ9ESOVHUN5314G===="
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
