package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "rg+In8bquGWv5YcusZ2+wO3Ochb0+MmlyvvALF7Eszk="
								"x.cue":        "QL9nkt2TqyKFU6u1DaOrR38oxoG32Pm/+rklTpX/b1g="
								"x.json v2":    "Nh1ujAWjiUyDtbGnzbnrKlvv4/PmoozHFxagDWEUVXk="
								"fixed x.json": "SZ0bShKZIHwS2EitzcAjmeqw/ZDAgWpvf0rin8c70ME="
							}
							multi_step: {
								hash:       "RM19F0AJPDI46ISO1QIPJU1S1I9MDDFMCHBOENL6ISHQBM0AJJQG===="
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
