package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "V2aLlKU4epYSc1Al4LyJuWLmz6lPTkJzen0jNk9CyoI="
								"x.cue":        "9j5towT5RTZ1vuuuapSvowHm7SyYjBYUvBILvK+NRzE="
								"x.json v2":    "6J0lZSymA5OqP0TrxP01hDB7MEbBn5M2mAFd0ORjriU="
								"fixed x.json": "3ICIkdTRwvbo7Unhw952KNSYWeOXunYd22giaUxemnE="
							}
							multi_step: {
								hash:       "8ICKAUMBMC4U7U89QJ7727109PBQ42S6R60GHI0Q6SI5K581235G===="
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
