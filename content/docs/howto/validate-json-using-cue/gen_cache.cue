package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Kr5SslPkVJV2k+DWXZ6R7hDlR0kdf+l0YWepFtbmIe0="
								"x.cue":        "fN+9ZGUiJAD8Rkb0D8BegFf3Rh3IGu2JEcypVoFvVCo="
								"x.json v2":    "Lq9ZvoWT2PNSH4b2kzNoWWbWALw3k+exKFELbebuy1c="
								"fixed x.json": "Rwb8rF6lvtCS3oqY/FlI3XfLD5CmN0iQU85+iyOt5JU="
							}
							multi_step: {
								hash:       "2LN5O9UJ8D92U82T7DG2DRBDTP68NA4F90NV9OG2KSGH9OJDPLI0===="
								scriptHash: "HHB3582H40QFQK7U74QQRK0GB24M00NKJQDCTTKAEPL5Q2NDA2I0===="
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
