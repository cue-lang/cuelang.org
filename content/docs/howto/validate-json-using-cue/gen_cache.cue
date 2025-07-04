package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "SMhzbngwgrUQbqcfCcz7Hy+FV44AuUWftBUeXDQ94ZI="
								"x.cue":        "DZLY9VfhqfK+Y+qN7S9hnkO3CPuN9aYo4eokW9bNXnI="
								"x.json v2":    "bi7TFaIp90O6XZnRMuPocuTEoX0CUVdGsXYNMbK6/1w="
								"fixed x.json": "A4GSduSCmPq3VrB2MtC8Z6SNpKp1D59KhVrTBwo6B54="
							}
							multi_step: {
								hash:       "US73FSDPCT6DSJN8O0P4HQ45AENB01S0OO4B08559JKNH6K54TNG===="
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
