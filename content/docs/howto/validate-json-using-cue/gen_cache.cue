package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "3IG9NBQ1W6raRUP9S/iQgegJWceHHSGOQJIYs9ZIIFU="
								"x.cue":        "nuRx8TpIQv0EkTDan2uITS76YLjJsrkj3rQEv+woXb8="
								"x.json v2":    "WnGfMmx0E1IAiWphHfI8mxGOM20ayThFRSHofZtBjw0="
								"fixed x.json": "TZvZ013W6L/mfzzfE1GwQF/18rOvueP96t8/BLvXlYw="
							}
							multi_step: {
								hash:       "I9E4PIV9TOO4KDQO200E5GA84KRP6HUCFQ0CDMULU6I5GGJ914KG===="
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
