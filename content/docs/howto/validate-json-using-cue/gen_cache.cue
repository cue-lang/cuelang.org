package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ySEqwbJlBWX7xMUagyiPRubObGNkCLqmd/tmef1rAgs="
								"x.cue":        "t9GijICo0fv+tsoC2GOf7LUwvuBRpy2JQ7GyaqDYwgw="
								"x.json v2":    "T8DNA0yZP13P+bRyFBmVObystT7fQqtdG5Eih8n+3ds="
								"fixed x.json": "Yft/w5/RdYqSHbeHk4gAamBNPv7yi57MFiazKcTvbV4="
							}
							multi_step: {
								hash:       "A0DD83B0VAB4PIHMST7493Q06F9HI7EOLBVBHBF4PV9IVLM1S190===="
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
