package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "t5b3w7OVz3MZPIYkXyDCXgPhRgyKWc/I1lC6ETkblzc="
								"x.cue":        "O1UuESMRiQ1+Vlq2B4V3QjC3Q6Q8QCGp5mps5G8lg40="
								"x.json v2":    "z1RNGe74P0iFhi2pmEJ5NnaCHI2vLOSsy3zTzMnTqBc="
								"fixed x.json": "vp9OIWXhgktLcINshEwlrgEEv9puYlCAbHTzpYaRZ7A="
							}
							multi_step: {
								hash:       "JGO3TSUG467AR1GEES8ENROGPQI0TK90H6BA13CFV9H8BE7N3IL0===="
								scriptHash: "TSK0AHJP6EQTEE5K3ON49LP8SMSD10449MAOD1RJA91HOUOLHLDG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
