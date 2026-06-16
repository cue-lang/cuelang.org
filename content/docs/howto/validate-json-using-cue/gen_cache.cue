package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "7UwwyTtdSaSPMGS3A/B3QxSk8HvFVqeaXBXkmTSKyPo="
								"x.cue":        "ZtsONS0Hz4tjR4djGsP1yvwMt7HLWh4XE7uNyemHml8="
								"x.json v2":    "ba8m1fWv0TfsRC9Jl24sMYEhnSPJ3QNRvGFYIYwgNLU="
								"fixed x.json": "loCrg5bUYI/dtrtbUqxHaSPEwJyh3WpvLcKGXxVebso="
							}
							multi_step: {
								hash:       "7BHII042JG0LDF6E6HVIRHGJI5RJOO4NKLBVFGSQSCJPJMRUKT5G===="
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
