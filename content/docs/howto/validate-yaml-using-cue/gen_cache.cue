package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "OwaGjBFnsrgEPtTY+wYpohk5EqC9HlIbWBhy7oj21d4="
								"initial x.cue":  "2GViYeqrZu8FnJhAfkf0BoYmBSKjudJMerQScT3UjGg="
								"another person": "2aHwPnEFSyvq8OEC+DpYkLj+i2bWabx2VkNUmIQLv1M="
								"fixed yaml":     "B81eF2/BLOfbGor9TXxY3gvJlkIa9EQN7aYWIO08/wA="
							}
							multi_step: {
								hash:       "R3QV5JDRIUF20UK6R4NPI71DO0KG9N8I2F3LPDEFADNHTMK0S1PG===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
