package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "shymjZ+kTcvZ2Za0rK8xaKHFz84UwAQ7e5Ou7XLpn2g="
								"x.cue":        "/xhJ9ZGWzTd1sFJZM+JwEq9jrMFWZ91IlyeKixPa1Qg="
								"x.json v2":    "9DVf9AKCVueuYxPeSAkNSIuOtydKtJZtzq0WYru4qVM="
								"fixed x.json": "mo1DTxhpQTkIgpeJBD93BWOaat1MGwNL/HWkWO4kxpM="
							}
							multi_step: {
								hash:       "HFQ8N25B1MLS269VQ1PN1GHPBGA8RJMH9K8TO2R1A4MFBTHJKN40===="
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
