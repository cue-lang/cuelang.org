package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "aqMPQKkg1c2k7TE+jPYNtWmyfBg/AROysrlROPJAXAM="
								"x.cue":        "tG0DRoLj6X2kfMvGrtu/xweG6YWAkLIpJ9opieDFgEA="
								"x.json v2":    "uSf+TSO9tAOC/J8uWDZgSgRGI1MbvzPL8uAH1Lp8trw="
								"fixed x.json": "TOPr3q5Se8OWsfdTGuAlZIJi7umGKBN0qwLfqpsdDf8="
							}
							multi_step: {
								hash:       "N4JUCIDL0088D87LRPFST6K0A073VA8K7RGB5KNK96CR1RLKBVU0===="
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
