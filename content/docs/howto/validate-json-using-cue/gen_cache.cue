package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "9VjXT2337jgnr64vmAeMFDfB5/ZlXNGtghoEmfR/ZEI="
								"x.cue":        "6c9OkjSHqwwehu9fSDqUl73rvdihWDEgxV+8CBlM/D8="
								"x.json v2":    "ZKxNSI1ZHlpoIOwphGEkOHhViVVL4VVg4PkZMXBjMyk="
								"fixed x.json": "NqoaXS315eQTNQiZB1b0CShNmd5DpZ7o9DEHlGwpObY="
							}
							multi_step: {
								hash:       "K2E09C8R6FO500H7BLS6D77PIOBCVFIP6ROUL2CLH0RHT4E2SA00===="
								scriptHash: "TSK0AHJP6EQTEE5K3ON49LP8SMSD10449MAOD1RJA91HOUOLHLDG===="
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
