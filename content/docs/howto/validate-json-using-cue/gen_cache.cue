package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "CZh9HNHGq2fG/n3tI3nhrl+HcerBwULnO2Haaygop3U="
								"x.cue":        "u1/t9wN9E6LOCE6vKOla/xzQj0wjg6gcXQguIYnnTNY="
								"x.json v2":    "G8TuWsHAHxFrlni8DCCZ4v1xtDrhWuJCz7lxJu9dSG8="
								"fixed x.json": "V/donLgwA2RxSMFK5k+bOGBASZFSIh7Rz2P+kSbUhAc="
							}
							multi_step: {
								hash:       "UC91JUPJQ7PUK2DKH7E3UTE9ABMGRSMLBSDOH55BK6MMHVI9ANS0===="
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
