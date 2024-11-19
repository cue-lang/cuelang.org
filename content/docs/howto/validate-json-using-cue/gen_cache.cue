package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "heG4OUHPRV9uKEZ7I8PzXphV9maE6zjOVn2ODoVrtmw="
								"x.cue":        "DQfSP9DQVAnveOIz9gGySPXoBIruoU/Tpi7r+062aqQ="
								"x.json v2":    "txC0ZHTpIJTA9TdXqlHzavx+lvDPmL/IUa6+MsfHOww="
								"fixed x.json": "DlTOXZAhocFvXMLUGhq9XONzID+3SVhxN/NIQkJm+x0="
							}
							multi_step: {
								hash:       "EN0KUH7LMPFV6FNEU5SCEVRE8UT4S6G72BT027D4VCDN845VRL40===="
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
