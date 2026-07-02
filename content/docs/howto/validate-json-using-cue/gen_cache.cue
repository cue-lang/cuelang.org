package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "8azo9ytkLGz7FMCl6KG7YooXTcM3r5qAkfN6RZx2yc4="
								"x.cue":        "m7qM905h0EBj/kvJkRy9yWPbRAfozL0KdlMKC14OpVk="
								"x.json v2":    "bXnKSEPI4qMM6232fXsO3nKWulbfkVVSeA11S4h3P8A="
								"fixed x.json": "12fDT/4YNcRlNfKisexCP5Cd4g6mjTwpXF7Be4lER3I="
							}
							multi_step: {
								hash:       "700T8QIIVO0B630EONJOQECB9UN5EPLTSF207UCA47S4QIPEKC5G===="
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
