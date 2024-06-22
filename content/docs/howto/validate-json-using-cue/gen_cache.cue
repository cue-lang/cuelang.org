package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Nf2V43yB9iA2+xBlM7afRtIXf4KPGIHMZUapFxicmpE="
								"x.cue":        "bYjohTXWFBs+gkPHbzZU3u5c16KO9uPd8RcAQT0B0zk="
								"x.json v2":    "rKTjSw4vGQBIRw8dLA/38iDqNwoRg5WmTiqq0Cw5RH4="
								"fixed x.json": "B4EKhi60byAPxSc4BXbDre7605hwQGR0fvOumgXCiw8="
							}
							multi_step: {
								hash:       "V4TJ7QCGE90P3K3B8IN70TDFIDUHJPGVV14O87PTQOK5MA4HIE80===="
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
