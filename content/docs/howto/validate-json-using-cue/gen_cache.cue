package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "fqtNpeiWUEdKBiu/xT7cMq5htFnDOuKDfoPwE4Y8JbM="
								"x.cue":        "eTT8AYx1DejQ8DWYRMUtAcKd9r0CqpDGIKC9jW37IG4="
								"x.json v2":    "Id2xzsb1jZd8o510+Ylv5+h9DzHkerDyKXK+rFYi7bo="
								"fixed x.json": "ZduztP7VxWK9OFFVDV8jRZYVj9cTVdGkjowUGKhZmU8="
							}
							multi_step: {
								hash:       "DG4UMS26QP3H748A1CCB53TVEI738SAID1CAHMR2NF965VGQVIAG===="
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
