package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "3TFkFAZy47z3lW05bq+EkEQcESIK8Vkjlb+Xi/qJySg="
								"x.cue":        "mpNODU0K/FWroKYutZfEPQHdNH/YMRr33/n0vNThC9c="
								"x.json v2":    "1SsHbKwFAOvGRyUEcfn7dY7irlrPxpc7qnqVk0vQarU="
								"fixed x.json": "S52GuEi5ala22MEpUSeKAE/n/bT1JlCln9wBq9grJNo="
							}
							multi_step: {
								hash:       "BNI87K1DP8S23IKP43O01IIA9F4EQEBVS1PJKCCFT46RBG1TD6L0===="
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
