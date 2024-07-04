package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "NLQ5jNkzzVA2ZbwgQolqyQfefewPTrms9oqZuybV5ww="
								"x.cue":        "p5jurZQdMPcIyijtsDKRMgcchIg4Ot0ZRoJyvGFyCH0="
								"x.json v2":    "BC98ehkKtEfa3mYqMYHIBm9FwoFBLNezII7Vchyp27E="
								"fixed x.json": "NfnHUO8CNlr/L6F8V42U+hivHnKFskiofliG0rtqy9k="
							}
							multi_step: {
								hash:       "4U0K3O20782GLF5DTVMSUVSGIUNKP62PU7CTEIMVAFA0E7J2SEUG===="
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
