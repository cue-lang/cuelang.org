package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "P/d3r3sWCXPPbxyCGTy7a5XrkTjjPH7mfaO8EDe71BM="
								"x.cue":        "E8WqltSvigPcm4YHYX9unbBcdLN80nk9F1kqNbegXCg="
								"x.json v2":    "vAt9Z1DlUALdCA7RzgE4OJu0Ws4lEl0+GlJNjsAUelM="
								"fixed x.json": "KI2b7YazOQ6UJJcutj0ECgF4B7Hs1NNpIVC6rhm+1m0="
							}
							multi_step: {
								hash:       "CL6KHC3V832RFG21SI8V6RRU43RCMELFO8CB0M9P05OB03D5QDM0===="
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
