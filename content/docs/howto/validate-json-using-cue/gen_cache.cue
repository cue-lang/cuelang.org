package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "onkDiq0fWsOnUiDqK+ZreB5su6SGZF5ijk/qEe7nL5A="
								"x.cue":        "VgMX1Dc1OD/ijjcOwAwK0AF9XoJiBSzY8aiMl2DapB4="
								"x.json v2":    "v2od6pTEUifNFg/mCojrUB5TN0xjWNUAzk9i1A/EzsU="
								"fixed x.json": "d7/h/Qg2ofYqhGcsq3vyULFFZ43NWBmTEF2UbXGCnw4="
							}
							multi_step: {
								hash:       "1O75EOM89JPQOF957UCMH3TF6N677F8SPB9O35FM7QGJ8VLEHJ00===="
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
