package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "/6AhMwE1QIJ894dtL8EXwqwLEQHPHC/0ZHMLbhEcrDo="
								"x.cue":        "WaKv4Dsj4NvyvnFONAtZEIIhxQ0w766jwVDj13Wx1lk="
								"x.json v2":    "zWr9mYeChQe+25PU997WLuGAMrfrJaP5TXxCrA9aRx0="
								"fixed x.json": "VhkVEDHhf0Bqe4vsgbXGmMcnZiBYBBpEKEFgk4RIGdM="
							}
							multi_step: {
								hash:       "F84AHL3G3255RQCCOTT6ORB4GCKIS3FPDOR57BLR44THSM8V5K00===="
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
