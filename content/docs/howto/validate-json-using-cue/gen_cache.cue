package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "d4+CBnSVfJ3wcFrdaxI1k7y+MVeIwDY/4exqmlPQgn8="
								"x.cue":        "2J15kDwc87+D5giqf4lrdAYyyotO5+ZZsCYNWOmn+3o="
								"x.json v2":    "cqRb42ZRYP/Ngba56Kreu33sw7h4keGZPHXgPOHO0f8="
								"fixed x.json": "diHtiabVUvKx4RKSXSm44J3Cj8CDqUV0pIWQjiQpANw="
							}
							multi_step: {
								hash:       "PSO2QTT778H7RSNMIRGRFTD6L7OQCOVRLUQ78LC3546OQHF2ETSG===="
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
