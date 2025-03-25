package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "4eq0DdnArH3K5XJuU3So4Mr3u/VxY3paS429cO/KP6M="
								"x.cue":        "qesmy/viQHbyR3PRByG4qTTv6MIeuEE22sa+zvRRDUY="
								"x.json v2":    "PG0KcvAvjZ4n16y/REmghhckWG9Geex3e0BirWEWRgQ="
								"fixed x.json": "OCWfTYTL9Mt0RUJ52LjCA1m56w7p0KU1vekkNLxpzfQ="
							}
							multi_step: {
								hash:       "T8J3KEIOQPASK5TJ3L5GE1TKN4ASIED6C17L39OJ47UUBAFM7L3G===="
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
