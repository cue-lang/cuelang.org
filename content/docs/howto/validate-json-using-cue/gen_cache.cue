package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "VUJpVP1oHB0wV927VFw3ZGNhSYC+jQAFvwAP3mt8KHI="
								"x.cue":        "EriIi3t6KUiOXpu1k/1p9WmGGkXssR6gCy1lsPAgCoc="
								"x.json v2":    "K6Z2mbrGJMtOS3IzX1ocy8NTlfBUbw4Usd5I8eJ41LE="
								"fixed x.json": "Eq1Xwmio1XyxhXp3R4L+Kl5o8mdezVT6dtGSqhBhPdw="
							}
							multi_step: {
								hash:       "UPTCPBGFE9G81UV1E6UCGP2T263M28RG55KK1S5N42JKRPRHD1G0===="
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
