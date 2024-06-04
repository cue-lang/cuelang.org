package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "njY1c1gcKFCE78Y0E/N7xvigLJxMltMMvqtXC3/chdE="
								"x.cue":        "bTaCK3eFOhXqZZyW7jH+zmrcDnPzO0/l9egSBtcqcWk="
								"x.json v2":    "R5w8IpY6fYhYkRyvJjoTLrai/2zzOp/TrNYm6DkdD94="
								"fixed x.json": "/MbDjKD6uqZXoAPsuORgAQUfJsP1rmBfqcsf6HyV+iQ="
							}
							multi_step: {
								hash:       "HET26R8FKQ6J2RTNMV1IV7HS26N45KMGGFDCGKNE736I25RM6GB0===="
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
