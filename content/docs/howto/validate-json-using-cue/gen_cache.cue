package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "JH6ZV+w42B/mEwQ87KZeYCQh8dgV76K7KCksRF95/4g="
								"x.cue":        "bhEhXgkSce03Xp+jRcDq6eBsL6njXkGOQtkACkts4f0="
								"x.json v2":    "mD+r3HTMEjb3g5ZlMmHwZ9Jsr9kGGD8UjzTeJkbBMEc="
								"fixed x.json": "eBVlYQIEp9L6OGOcre754iloyBe2Vaj/GwDrAW6F2u0="
							}
							multi_step: {
								hash:       "30D8IABJGU2GVK4VE8OKTHIFB3QKI19B7IF1RJPOI3S6DO0K3F30===="
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
