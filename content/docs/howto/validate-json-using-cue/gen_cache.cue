package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "7SlX/65MpBVc0CHq5rDOpeBsS28qMkbNe9wGSGR6ldo="
								"x.cue":        "sOON3tnbsmIWE/T4FTi1cEyd1GdtqwbVclAy5C80lcU="
								"x.json v2":    "pSItMqKGy87Hx7nT6d9Te+EKc4C0IaI8jGew9VPon34="
								"fixed x.json": "Jil8pR04raB02kBUUZ3vvK1tnnBDB2m2Gddw2XcYS3w="
							}
							multi_step: {
								hash:       "8I5CK2SSKB0Q27P64G0P1NI0324RG40GF48HRD06MI6EGHJ59OH0===="
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
