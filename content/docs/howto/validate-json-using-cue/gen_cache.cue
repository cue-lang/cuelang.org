package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "pt9rcvJvCzr0Z+MCVMoik6NQds9S0YWN8giQLk/vQu4="
								"x.cue":        "uPaWUaSAs5bMak4FHTz0gqGRbdh4UdAN/oNHVZFg1NQ="
								"x.json v2":    "6zN97OSNYs2TmYeUj7Gz0h2X0nprNn31GX4gloFDx9Q="
								"fixed x.json": "N+T2FnwRS8ypSK2MB3eLfkKa1LHyL72PwEKS1/2OEEc="
							}
							multi_step: {
								hash:       "8RHC9IFC6H0HEB1BT3AL8523FGO7LQF24NE9Q0PFDVB5TAJS1U40===="
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
