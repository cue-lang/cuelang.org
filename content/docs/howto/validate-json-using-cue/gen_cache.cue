package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Yjaj4hXydtEHsopKfLwy/h6HNiyy5M2hPa8N+BmvGGs="
								"x.cue":        "l9fOTpvNGBIoBGvwp135VhwEN7pGVqQ9Vsn6UxvzU5g="
								"x.json v2":    "zp2MOhbwKC5xusMthBMhY2/9+Ma1mk3syTLHbZXqSMc="
								"fixed x.json": "Vekkw7LRcFg3D8z103LVrloEBGDoWks6WNrHgH6MabI="
							}
							multi_step: {
								hash:       "U399QQRSGGQQ20K10I0L9CCNE5421NCQDVSQ2KCNOSE0PACMFAJG===="
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
