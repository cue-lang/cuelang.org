package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "WHX/4ChWVAFyY9MiTQNpKrpe79g1uMKDC1tXVyS06xI="
								"x.cue":        "pfNmi51Bu7zCRCtH4DNjCsHQbHo7c+LIwjf5LNlJqyA="
								"x.json v2":    "saIrXL70vvqJumBUnNkApy7/Hi4utU6cxJ5H6feuJIA="
								"fixed x.json": "dM8qhzbgsPyUQFdT8m8RMrPsrff4QqWr02XkRsgbBYI="
							}
							multi_step: {
								hash:       "GCN0NC0A2G5C80K6JFUMGJUD6SDF3VGMIII1752PHJJV8RE0IAQ0===="
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
