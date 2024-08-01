package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "l5s94+vdSeacYYGEO32bTWk8XWq2l0e5HwNEMGH9LHU="
								"x.cue":        "tYOD5Hs8HxPjfS0kqRiQZJVNMtDXImpE7LScye3YLdw="
								"x.json v2":    "4lhLWHbMZlyJ7rK86jp5+ZbqFq1HeCLMSKBHXT+9Mxs="
								"fixed x.json": "rRtaeGCSkvuLBg+T+1SCfjYFONUjMTXfQfrQeWHNmxI="
							}
							multi_step: {
								hash:       "GD8F92C6LPESJDS3OTCAMJLMNJI6TNCPG6GOSSRSLEEVI4T2H8IG===="
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
