package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "jSK5l6NMIyebnHk6AON4nIAu51hwla7dJOelpC2u4jI="
								"x.cue":        "RqsylkPIfrc285RuSRGaVMYHLIlQZwLP2LeqYnVkFpE="
								"x.json v2":    "QUVM18rJBxEzSzjx1cNxQOK59TS/qyufmELZoOlkZZg="
								"fixed x.json": "5uOHOCnbRIgmekJhs32ZuwqEHCRI3OAn8vzP50vyP6g="
							}
							multi_step: {
								hash:       "68HUC1M302J4H7ACD30NOKEE636JSMJ9RA1B5DNCJ3JTNEPLGJTG===="
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
