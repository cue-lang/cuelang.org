package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "YbyYwZUoWhW8v5rNFHz9ikVbgo5vmEOdsbBotPBuzRQ="
								"x.cue":        "MBXsjnBdOWr+TTwwVHHyiUAPg18S58MZ8k6T5DwYkDg="
								"x.json v2":    "5ck28dfjpFt9FCxE5V7mvMwNh7GjDR97cRsK9fIqeLQ="
								"fixed x.json": "SB2MDqZW6hdwVfk338c54UD6LY1zc/PA9Ptz6so+v80="
							}
							multi_step: {
								hash:       "GPP2PU10IJURTJANGAO938BHIUKMRGFU20NFJJNQ8MVIVV5AGDS0===="
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
