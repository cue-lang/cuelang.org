package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "kRZW2YeivfMEX+NsH51hlXBALnRlJF2wxxrkkH9p8Rs="
								"x.cue":        "qL01rWCCgK7tToD0QH3EdHsHd2h5WnO9HS2+GrYH3Y8="
								"x.json v2":    "OwwIOl+TYFi2T6Rk9vb3nfpoFyv0pLRPbkbc5/00sgI="
								"fixed x.json": "8AqW26vq7YNGvnQFxwOSQo2ykJARBC6NxD6LZpnAxbI="
							}
							multi_step: {
								hash:       "AEVFMLANOPCSHEF7M105I3MBO5ELJ702JOJTPFKRVI49T039TE70===="
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
