package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "a9J32DDtf1r6mtNZsK4Eq/Q44svyj9F2cUGs6J+hBeY="
								"x.cue":        "CvOJYWMn9jzAniR1cDI4dGJO/VpGEV9ICK0L6przAZk="
								"x.json v2":    "3aIcx+OYfOg8oHxWupWZA+lN4D0Os+P3iIIk5zfdbkg="
								"fixed x.json": "Ly2sipQC/BSIsSGzOi1LdUeXAvIivlGR/FSyKCzxk1A="
							}
							multi_step: {
								hash:       "66JJFN1J7EL75BC97K87PD86DGL0D5S39M1ND33VHAS4B8J5M9BG===="
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
