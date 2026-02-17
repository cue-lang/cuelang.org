package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Rlz2m/n2ohvDQyeob1PIZt1U0oCJXbj3I2KwXhHV6pA="
								"x.cue":        "BU9azqz6CAezLgXMdyrVH5SNdUON/bLZgOJ7fyTms4o="
								"x.json v2":    "TmdasD22fizHyRnwH5QYnNjboO+zfIPwLJPLSABDU54="
								"fixed x.json": "FNji6uxDzBgIhapAY+dS7TuYnjmz9Ez6WeJ5g6wFauk="
							}
							multi_step: {
								hash:       "E93IN4DI3ACVBT2N4TIN35FGVG9G9GS70DJDINBGK7SGK55SIF6G===="
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
