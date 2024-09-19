package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "5KWiOdvgxb51tzMk8P+AENmL+Rz8hm6+m2x6HLKwYXw="
								"x.cue":        "AmJZcncMY9tquqPy1s8BNBnMTCClvwQ58WEOjVWmpbk="
								"x.json v2":    "de7tgWrL3+42yUUUDVvbo/rbDmrx7gQbdeR4/iNW1ao="
								"fixed x.json": "t0EW0mEEARywMpfLfp8BxvYJNtFSggBV31/ZHtbBatk="
							}
							multi_step: {
								hash:       "FEEILBN57RMVHQRC72TLCGS73O5FL1133C91NJ4H69DTM756K5L0===="
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
