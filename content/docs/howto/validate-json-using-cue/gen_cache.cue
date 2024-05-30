package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "NBzcl2GZWHu+BySe8zyOQepXp8Gu/zGMhcjqAaVwYH4="
								"x.cue":        "ucDc2l6RKktFPAk/0rwpiWH02A9VbyebLYTjjuNOmec="
								"x.json v2":    "xVScHUnZWDKOzTz2z24e6/aBolXKC1pqSDKNZ+TXqvE="
								"fixed x.json": "4h80luwT57+3rZil3gVLaaWoFQUqw9KnpMyarBQFPms="
							}
							multi_step: {
								hash:       "MNO7KOI63INAAHUPN58D0OV2E4O6SPICF2BP2P8R0CD132RLVMSG===="
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
