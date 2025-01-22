package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "6dqUjfhJ2H6xTerPGmLpipUAGgsyrk3mhw698gxxuMM="
								"x.cue":        "SdpLjWr3orl4qy/3LjSIZpdS7vZrb1OWSDEPL9tpRKM="
								"x.json v2":    "OYCqWY1UqQDaMujv++IwEk3SnqL0PRBxtFTgP4j0qAk="
								"fixed x.json": "oQQaCkpNpR1r5GlWNGCQs3pZ3hmGdqrEP7iXe62qpo8="
							}
							multi_step: {
								hash:       "C6717780K6HRSTENQJASGMUOBLCKESD2086J5RQJC5728LDQN1V0===="
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
