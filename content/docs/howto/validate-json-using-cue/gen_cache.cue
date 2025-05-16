package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "odWNGes8xzRke26UulyYf4Xwpd2Msf+lmhnfwhw+4nE="
								"x.cue":        "AVaZKFFq+JZ4E1aZcyIXnA2wGiU0MOSIccH4duhABMI="
								"x.json v2":    "6//C7HCaHTx1vP1eFyi5J5S9LQPcFbx9MrmjRyB0HRk="
								"fixed x.json": "QUiTTYA3/YQHRkouhzzV52DCc5fMw+8AjfkrjcRXgvU="
							}
							multi_step: {
								hash:       "ATU1R6MO1BEEPF9OJ6R9HF3CII9OMLJE0O8QOPSH3G2L92VM6TRG===="
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
