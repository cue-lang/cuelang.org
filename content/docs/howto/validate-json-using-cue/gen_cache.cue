package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Pur/q7NANRtOq8zZKTyhSzZ13hNkfxpFjP9y2Ni9uAU="
								"x.cue":        "+OJjOyeW/N82XuIoAIatF9Ovz/nlqkbvDePTnv0KSdc="
								"x.json v2":    "rTk9W0U8DYWLESlIIbKsnWqcMXllzIy0fJ0Rd+uGmBY="
								"fixed x.json": "JhQIpTBs/M0kSCbamWnyUGJdXVU1OpPgzozn+alvu8I="
							}
							multi_step: {
								hash:       "GLFMU1VO8QRND7LVTBPOKRG8VQ5E6MO829T53N6MCRD785UP34NG===="
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
