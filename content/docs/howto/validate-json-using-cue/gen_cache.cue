package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "c7209KWVIA1E8qFo0X1XRWcw7IXAC2C7+NOHsSDiLA0="
								"x.cue":        "MOctZEJ/P+ti2jA3r04N6RQ3UByLU6ahNjL2vOyu+Rs="
								"x.json v2":    "i8V0nQNhPxXkkStn3/W1wYI4iz6J0b1M1TSRhdAFVXk="
								"fixed x.json": "kJ/NGl0wECBteLDAhS+GhFpY5/LWKrnYYsteGFzR2KQ="
							}
							multi_step: {
								hash:       "T4TQKBOJCQRGNAS02JNMM9VOUNCIAIIJ8J7GI08T00HM9S4NRJNG===="
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
