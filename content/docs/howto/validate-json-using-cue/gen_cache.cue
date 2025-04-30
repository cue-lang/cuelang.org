package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "KyJ1RdnvXyCqqIRtI2b3RTN4paPCr8KzO7J9mjD7WR4="
								"x.cue":        "2YcdqZynm+m1TbcW9rcEIZU5iKxpByzu5m+k2pvQ0ig="
								"x.json v2":    "5m0N2ICTq9m2KUFbrcsV9rFsvq0bOkmLjL8dN8e/OEU="
								"fixed x.json": "3W9SSbTQ5hqoQlMoAhrIhz70jZ1TdO5rJJg3YLHuk6Y="
							}
							multi_step: {
								hash:       "J3V63GDHI4F00LJOG7QF29JPCVSADFUBOMSBHQ4APAC9LVP99EMG===="
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
