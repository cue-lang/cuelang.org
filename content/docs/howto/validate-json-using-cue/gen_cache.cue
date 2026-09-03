package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "knwp+Ex/1vYLCRUZL7ietHJJnCVc3bS74/gZjPB7rCw="
								"x.cue":        "aV9Tx38uHXNlNT/K9EPsL66xEZNSAK23uR7k3zsy/nY="
								"x.json v2":    "2Ij+Oe2u2aKerXG1BJxby32aTOjxw97VkznvM5vGiM0="
								"fixed x.json": "dAJeZPDfy12JPwL1gEbEEoqBJOJXueSOBz8ziV61B4Q="
							}
							multi_step: {
								hash:       "58SVII0QE3A7R862T2U267AN6VNOJF5QM5UK8IS8JAKAE82BK0JG===="
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
