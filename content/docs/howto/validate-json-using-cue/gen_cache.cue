package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "VNDOOLC6WPU5hN/ZirkiiyCElovRnKBTjRJDE3Nrft0="
								"x.cue":        "CnVCXtlJ6fr517DWGHh8s2WlIoFgue/Gsv9mKusXoDs="
								"x.json v2":    "isVYKrVKB3oDUwWSdL40KjIdK08rhcphp71nITgMtik="
								"fixed x.json": "yjPJl1wd/ZlsErbGKGElD7/dfCW+9h/tARn63Ct0+Xs="
							}
							multi_step: {
								hash:       "5PHJHHPORR04IM8097URCA78MJ2EDI0JI1ODJTAKMQTDO1MKVFS0===="
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
