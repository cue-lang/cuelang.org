package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ua4aZEDuPlhbrx2KtelE57ubo9xPZzJfLiiTZRNuoxk="
								"x.cue":        "NauSFvBEMUNT9N/O7QK+k1ciUQ9KX+7AGKaqys81A6A="
								"x.json v2":    "nK5xyWrrwq2WX/D14TA+UuZwUJIXz3nIybtUZlRWjcM="
								"fixed x.json": "MzA8A+cZ/pGSWcZdAlOr5M9J5iPp7BpzJgHckBzeRp8="
							}
							multi_step: {
								hash:       "FT66JVM1Q7H0P748DTHC9SNUABLKJ53BA733TBG1AA3U3IVJN7IG===="
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
