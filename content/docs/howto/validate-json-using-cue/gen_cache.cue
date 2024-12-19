package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Fp+ImP3rKA/ZJBULlmTPULCtIgj3B9vaxBWrKoSFKAE="
								"x.cue":        "QKoQO+oulL6ROhKviMZZCTw54CzUeSkQZy43UsR99iI="
								"x.json v2":    "sDTb6DAb7pe5vxSwzPsjfk4qdPzsd279spDCYU7vzuQ="
								"fixed x.json": "YGgujvamXkomamG2wBV2aqrHOFUoAyuCrPnI0FRC2MY="
							}
							multi_step: {
								hash:       "8EJV4H96H79EFPQBP1NG1N9F2OULJB3ND20MTMVMAKHOL6UC8A00===="
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
