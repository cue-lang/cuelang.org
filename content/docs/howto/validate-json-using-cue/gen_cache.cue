package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "5uAqLRwOH4sUFX93jpHiSBwo2LUABJ2pHY+p9yoCtpw="
								"x.cue":        "dRyD23Ws/zu3b7OsV+wY261PENkgIJlR49iS5g6qbNk="
								"x.json v2":    "cZZiwO779HTU7glmyeqK9pC+GiRshVdKv2BeFYUA504="
								"fixed x.json": "7bkjhbhoKePlWQWL0/waZ6Dk30vGeUqdpzv1mRC8cg8="
							}
							multi_step: {
								hash:       "KHH323QJHHMAPOS36UV2TK8I7D2NV0KFQMNM30VMAI6IC6I9JS3G===="
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
