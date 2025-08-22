package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "LUNcw+mOFljP3v01uKc0jk2ssdRFzICo1qhwOB2gMhg="
								"x.cue":        "wEKS1Xge3A9eQQvTAmk9xWsbgr7ArIbIyBenz4g7bLQ="
								"x.json v2":    "YpuW1gYkzOhRNVYBeMmxyvCj0fDVbOe+Hu+iXuyrlB0="
								"fixed x.json": "Yd/8rnGnnIw9R6Zid+7Vjixttle7e7mGLay5Wo4e0uI="
							}
							multi_step: {
								hash:       "01TAMSAACFHQN5VVMPFK2JDRS6R955KPC90C20ACUMFV75NRCFMG===="
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
