package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "AaxIojFxJeUg4/xf93TM/DFNkChAbMgvM1wzboT1UoQ="
								"x.cue":        "AU5vgYKSR/ySS0fCvBv4Q584EkOv1Bhs4wn5S1jowwU="
								"x.json v2":    "SDrFgIlMawvvA9bTjHFnBwgD13q3mf6kUnjt46ayyl0="
								"fixed x.json": "AIfxx8ZQt3xdOVrvlkzMS2QV+xjqg3BK5KwnSvD0vuA="
							}
							multi_step: {
								hash:       "UU6DH5DESJ9J8H52GTP3JDE9KMUKT2JEQS4BRD6QS7VH2PASTNDG===="
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
