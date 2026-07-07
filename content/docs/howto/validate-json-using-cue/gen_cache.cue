package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "5ZIkHhyBnXzH/gy0N1oIbm979va5AaKaEsmeZ/2Bkso="
								"x.cue":        "oxx64u9J3gUU8Gt0jedwf0RskEoZYzt75sYRvrPlh34="
								"x.json v2":    "qNGSomolIZs+a3x7SJPlmqa7hLYlfe9AsOkarn+vuYA="
								"fixed x.json": "HeySRDaQKSXF+C09PT+w0nPxafUjgSE8AjmDU1MGFyM="
							}
							multi_step: {
								hash:       "FV4TBCP79LM0D879VPRBAR3OU5AAMEA05VN9SN3E7L23TKN5GSD0===="
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
