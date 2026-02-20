package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "qTQcvSfTbfU3PYSRF6koZDk1J3iwJ7egWg/kIxYYCjk="
								"x.cue":        "oblvY9cAAK7tJoabiWJVvzowtNToIu0irMrcVilcEZs="
								"x.json v2":    "iM1BBpybmg89geGWZiPOIljI5PbcZZVRRMWfixscNnU="
								"fixed x.json": "UxAj84jg4wK1s1XS3fdQrKsm1vu1qtDMpA0yOT4P+GU="
							}
							multi_step: {
								hash:       "1AN2VCVGQSDGF2C81RHAKH9D3DPMNA7T7PJUL4KA4VB0JN4FJCJ0===="
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
