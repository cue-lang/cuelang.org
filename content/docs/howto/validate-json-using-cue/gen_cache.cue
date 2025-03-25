package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "mO7hoOp7Nueu4bwSf7K+V2iLOdKxtQYGAbS9ykycDQ8="
								"x.cue":        "x4xr9L04VpUPAUXrq5xfj7aqnjmznPLB6itLkyq3VIE="
								"x.json v2":    "PYID6X6a6EqWKVSz5FmorF3kjVcm1qr6TAeC1LLthwQ="
								"fixed x.json": "DFqB+ecy5Xj4murpmeJKQ51lxxDO7umDqwqsCXHpYDE="
							}
							multi_step: {
								hash:       "NVAQ286T6SDIMBTRH4V7QI5FQU5VC3GEPG9EJ4KQPG3UQAHMLEMG===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
