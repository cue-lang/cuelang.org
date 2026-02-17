package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "P3b7lUoMBDLwK77n69izYMPXSWNJKhakKbQDDjSTbEo="
								"x.cue":        "tkCqUqY87SRnD1A5gjs5SbDV0vmCTkdXeudkHhyY2qg="
								"x.json v2":    "Kq9aib8ed4W67bBx3FfM9TXx9NVwnXCD5bwrFklsK2Q="
								"fixed x.json": "0qb8n26wjTrjMsHImkopZe7AS+SwtRZ18LluoRIcJYk="
							}
							multi_step: {
								hash:       "0P85R49V80TSQ4Q6HA0H42IGJ9JMO3A70FLF2TL6IMQ5DE1FFBS0===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
