package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Ytk4qQ7iNjT9osxfAL8OrApznWK9SbxoXoIHyt6iVyc="
								"x.cue":        "zrgRF4f1wohZzMplLIIdNIsXWs8GAD1lTRP7n6UmHBs="
								"x.json v2":    "JPrygfb6/d8xqAjYBowfDx45lTCpDY8cVpFNWjUbT/g="
								"fixed x.json": "gtmfVMjmP26Ffe3fnvV3SCbKDqzerzTd6eFeHN9pecA="
							}
							multi_step: {
								hash:       "7AA9QMB0VQE04U8UCIFP8HM9OE7Q29F530JTS9MTDVUFUU6QDING===="
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
