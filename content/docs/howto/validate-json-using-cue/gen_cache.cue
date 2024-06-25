package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "IrKWQRxJFbMlCat6gKTxuAKEJzHEg3vK83tzwCMwkUs="
								"x.cue":        "4x14BgXyj0zU0ZRp4sWTvVY66qtxr//PsGwIP+BYBX0="
								"x.json v2":    "iUB2Sx/LwUkextzS4Y580TI5KibF54WEhWru2AgpFQA="
								"fixed x.json": "tNbnin9KOMl4c+HCD+WHbXFhgSwttPESLgVBQ4lCPK8="
							}
							multi_step: {
								hash:       "R3PRTQEKB98TKA59NIBLCB0EEHKGV1AV1SARQE4TF2TBCNHU8990===="
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
