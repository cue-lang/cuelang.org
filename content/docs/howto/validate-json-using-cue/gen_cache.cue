package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "li0A52CjCDZcj+7UhxegtrqTJOTs9nk6nAntnwgkpRo="
								"x.cue":        "5CJvg08bMXV+LP3HrPKVVYc4vsTDc9W5/8YqWDBpalA="
								"x.json v2":    "WUeLWCoGFgas3qBoROLA/mWa8Oys5mQzJBVKThRVZ2U="
								"fixed x.json": "ztSfC5ViTVHCBdSonyfgeHt2Z/bcDFYlNqcIIJuDINA="
							}
							multi_step: {
								hash:       "HBBEMUOGIL4SLAGT2HQGT12LK3BN4DFD6D27P205NBIATC0PFHO0===="
								scriptHash: "N4K2L5MIBMGPDN4PJC36DQRL6RR46KFT8DK3RM5CL1H3TQBP4U00===="
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
