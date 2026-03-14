package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Wam++kboYN5Zv9P7XqUvewKksumWvj7Kq3vdH1weBoQ="
								"x.cue":        "dD8fxVf65aIWBrrdlxlBaFQZ/h2MeejDS9Q4lA2/Wu8="
								"x.json v2":    "ldup8uyMZF/mdnIMM9JFrn/dUsV/qnntYmCYMU10v3A="
								"fixed x.json": "gDOyN40JiMWH4uCcWJPSc83KyL2PNfHM4JKTNuhKFxc="
							}
							multi_step: {
								hash:       "P8KLLA2EADQRG7Q6K6IPG2LDCMOES8AOQ50TQV6MSO050PN37KKG===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
