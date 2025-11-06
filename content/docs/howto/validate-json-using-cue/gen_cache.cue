package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "+UTi8vVzPRSRvCNH9vVao3Y8zhU1IeACdla2PPQACOg="
								"x.cue":        "Ko1dnZqtQhp+t4RT/nZ81UpCXzbVI1Lzq62Y+FJj+u4="
								"x.json v2":    "A6urqS+t1EeKyNsY1HphgGKnGzqBSKuVV4fBVsVnX5c="
								"fixed x.json": "nU/HWPKa1+XVlgU6Jzm4sWFB18Zy5qLhob3413VuK2o="
							}
							multi_step: {
								hash:       "346V90CT3QCGB7CITOA5NH00G409SIT4D4C31M6LI53EOAMDEH80===="
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
