package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "56TZjUjLyV2AFZ8gpbXTaP+WozioffN6OAZHjAvoc3k="
								"initial x.cue":  "/wNL87z3VR8Tr3+s4rYLE5PM7MsmUmDu2GfLkbpdzGI="
								"another person": "qapuAWTmoLXBwh3KbBRBFnnZNlkEFmX/OX76xjGWh+A="
								"fixed yaml":     "qlBcdnuI+sd5v1XTmjCoT2iLBKUayZyyNDvYJzbVsvI="
							}
							multi_step: {
								hash:       "NDGMJ1PIBQJ3KVSA2HKHHEPTLLRVCLRNCD4OACIVN6KPGQA2V8OG===="
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
