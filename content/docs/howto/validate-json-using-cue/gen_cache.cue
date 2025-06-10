package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "uTBmaS3nFTZ3htxVjFdQOriWJWL5yRLkHwl5u/CLt7U="
								"x.cue":        "U83FbeUDOua/OozgBtIPklvjQYuOJzDz4u28s4GMQ8g="
								"x.json v2":    "B+LpyUM32SupAn2ziWlCW8ePxbgu00HaAUpMy0yx4jU="
								"fixed x.json": "/Lqy2Vm0SifhVbemET3BzI1FaY+O7Qs20LW0uHPV5tY="
							}
							multi_step: {
								hash:       "HKPTRUU3L15L780H2J9A6U53QH7N567MS9EMDVTTT2SBVFV4BB90===="
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
