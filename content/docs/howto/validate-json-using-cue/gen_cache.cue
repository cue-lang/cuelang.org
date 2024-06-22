package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "DCgKTzxdwVeyn3MOE10jTIYvqaOarb5QLRhCtowwvI8="
								"x.cue":        "+kOZcPNmwJUn+J2kbDFhB5D0FFE7YyXwI5AoFyVSnaQ="
								"x.json v2":    "FAQUEI4RGfVE2uHKgqSqkOnQLkXSHLPmPLc0oCTiayc="
								"fixed x.json": "njBGtZDIE4raiVA5LR6qgcy3073XUkcvgbUgACRVZhw="
							}
							multi_step: {
								hash:       "B72I6RQQE1RU54S603EQPMP0SRR29SJLLC5OHOGBRRR7C8EMSACG===="
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
