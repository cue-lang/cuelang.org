package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "e+pdxjk9W0JJN9ztmN9qEqIWZHyztkIUbLbqd4JTd0g="
								"x.cue":        "884eUXmrczvEQFkOZxHdufxTTYDirpaycyLqcIU8Jno="
								"x.json v2":    "ZyUXuvee260mJLLygHEf87BpTqUu6xFHhJLdFhcKTQA="
								"fixed x.json": "BL/rHII7G8DSHJHUi0FPjw1pE2DJZXFTB8PYZVI/0rw="
							}
							multi_step: {
								hash:       "QPECEI87ONMSBNSON2CJJKCG7IUU51P3N6ONRH7H6QK8MGHBV6OG===="
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
