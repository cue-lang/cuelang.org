package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "M8GWltNtswAVckeZ8qvKcNrJgAdlrHwTjCKWTWn+KC0="
								"x.cue":        "cw/9/8gGanJvcO8w0+dva4uBXb616qdhmNhtiSFMUHs="
								"x.json v2":    "Bvp3xhNu7I8E9FZ1oGn6DE6uSdnr0zH4thc0UoMGYkE="
								"fixed x.json": "95yqLrtcA/aDB2iWvbSNz0XjTHLfHZBtwaSEaWY3Do4="
							}
							multi_step: {
								hash:       "80S4CRJODMAB88N8GE2DUVQ46L5ECOJMR5DGAAE6E657KT4JPVB0===="
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
