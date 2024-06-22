package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "0GiXaYwu/JHtgUr6Z4JT6t4hMXXXa3pHfZwIh2Jc2IE="
								"x.cue":        "C1f8CDz1hjK/YqrOsQP5gCdMpOTp7NLDHZbSGN1xj9Q="
								"x.json v2":    "tOibnm86fJmQTJgq1NHBE3orGabulGecklegTivI1gQ="
								"fixed x.json": "5n1sX6MGR3O55SQh2Ci6D682+UPgBT+pZM130Kj3bbA="
							}
							multi_step: {
								hash:       "1HR8837AU72AKP0A0C3O4B9ULNSAJ2QN0NNL9C5U5LEEM8Q0BKD0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
