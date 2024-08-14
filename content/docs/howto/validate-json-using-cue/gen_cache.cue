package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "v7WnDhO04G93Y3AhS3DzAUzDjgFJ5lr4Cw7kaOUHfH0="
								"x.cue":        "+mPK7dM0SWpi/7QeyNG78fKqaLofvKMtjeQSwA/NpJo="
								"x.json v2":    "dQ8DBKvbKqyJ63lmdgNmEPiNdhGS889KveFzN0giPjU="
								"fixed x.json": "ehngviJy3bgq4BB3j1G2xL850OrmhQczWKEwXsPFHPA="
							}
							multi_step: {
								hash:       "T8GEREBI8B0B837UDLLD6CB9SDORLBE7FMD86HV1646INL3T7FD0===="
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
