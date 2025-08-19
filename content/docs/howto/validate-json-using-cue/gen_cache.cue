package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "vCmrfVaPh7CMiMNHyEPpGVxxPuzYCjXmT3E53XeoKbA="
								"x.cue":        "ALRyUyNtHcoKkUKS7mV2VkjGSscLxR8xP9oSYxxVcQ8="
								"x.json v2":    "X/007ea7SDWhEIMn3F1KH+s2S3k9gbjsqgfYgkLppXc="
								"fixed x.json": "helmqGV1uma3LtWuHpiAyHaJa9cTb7hRPNi2zNg3Yo0="
							}
							multi_step: {
								hash:       "1CTA69CCKV3UO6MF6O9MFVOGJLO8P27HVK6LFL5MHNI51JORJ8C0===="
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
