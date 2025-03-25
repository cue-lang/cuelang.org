package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "6Z31JGYVVpzhnuC586k+8Urcgwsi9C2CT6uhhQwWMyY="
								"x.cue":        "svgl0Nyyk4KWOna25zMQE+NF4JihrsqPTLygcsP+BVg="
								"x.json v2":    "8c9V52o2WTSlEBRTKE+MTbpu8mJzz1aJ5n/Eo85yL4o="
								"fixed x.json": "50bCnsZuLcXNA5VR8aKiorpGTV8G4lUYOxfDvrZQtbQ="
							}
							multi_step: {
								hash:       "5IGQF15RDE6PAHVSMU4KLFI932T4L9VEO9JSH7VPGTNGK6V5J7GG===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
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
