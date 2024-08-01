package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "U+KFAqLeJ7nV1a/O4MUrvnLDmOZ/bbBhychjLzpkdW4="
								"x.cue":        "FLSsWj1h+zxP1W4aOP5d3pPlPx/8lvbO93ogKwmY+Ok="
								"x.json v2":    "oKkY0vMMlYfrxK2i+v7FQwA5IqK7LlOMPa+uI19UxN4="
								"fixed x.json": "thm8zmvW9BuSnwrBiR/mMLiMu9vLbY9d5gEVHPlmaOE="
							}
							multi_step: {
								hash:       "ITOJIFGIHK1N9U96C777KJG0200KIMH8O9L8E30F60NI7I47RA30===="
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
