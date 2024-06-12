package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ZQy9VreEgrq078iHlgHWW1yGBjoMNF9y45FVgh9qSNc="
								"x.cue":        "vE+zrXc/HpS9/vHl1+u7D0B/yOup1xBFRfMcyxJtZhs="
								"x.json v2":    "+mxzUoGwAV36TDgR6NCm9l0MH0OmfHr/DtWDsmMTBqw="
								"fixed x.json": "hNH4Hd+mbNVW7S3oGd8jsZy9TN0pnCWX3T11keWzfAs="
							}
							multi_step: {
								hash:       "EEFK28SE3S2MQITV56FFU1CI0DCNPTU5LU2FB70PMPIUIGHUUCE0===="
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
