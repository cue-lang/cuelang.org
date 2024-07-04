package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ufvMVoCFR/uvKFZjFlQ990UVEU6R6gDndMUgK7zzYno="
								"x.cue":        "+9DibCShO9oE5fv8WiCNN0Jb5Ua8Ub659FySnRSlWYA="
								"x.json v2":    "z1whFa6afSaFyxTdKvYgZ0E0hgILnTTQWSNfRTCRK1w="
								"fixed x.json": "coVrTPgTnwIXU8+30ZLgUZCaE3+SeTFT5Y8jw0Kvois="
							}
							multi_step: {
								hash:       "RFBKIA0SVEO6T2S1E09PDBIMJG1J6Q9TT5PJ7SR9OO6HOGOI298G===="
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
