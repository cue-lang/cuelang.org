package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Wk85xnRomHsFX1IliUoB+ECBSTPBptPu/bKYIPIdJuI="
								"x.cue":        "fMqQMqV7J7uDx6up9pRo/oo3FqwpAcipSyTeve8EOkA="
								"x.json v2":    "G2R0GUW3rrfaaJr0VrVy5bIj/0Wu8mqclE0JVvUm5kI="
								"fixed x.json": "eS5ml/UyHoeJ3RCFKhpiGKHuXxfjCeyV1Auw22rCNjM="
							}
							multi_step: {
								hash:       "PI2FGUKRTFKGTP7Q58HKILFRDGR6FRQH7AG835HCCD0NANAJUGFG===="
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
