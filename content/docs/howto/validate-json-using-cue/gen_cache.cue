package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "+693g4c9hLeTqUoKCCwLH2bolzWdu+Dk61gIV9S8n80="
								"x.cue":        "NHcgvML6xIZc0r5QcRdXTFJQuiljvSNpLLoAySPHndg="
								"x.json v2":    "XZxqXtHKC3Cs5IGFDv7lge+dMwH/Qoika+qU/eOqwKE="
								"fixed x.json": "q8dEbOYOd/I5xMam6bdv5nc1azOnOYzacAyeib3FMJ0="
							}
							multi_step: {
								hash:       "0279RAS3TV3O5E6E94FD73P4NH0J98T47JVVDS0G3GOS13MBP5JG===="
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
