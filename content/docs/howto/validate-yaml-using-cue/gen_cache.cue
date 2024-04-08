package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "a0bkgCbDTnxIiUUHP1IIsM2KeIdF7dWX97KTq1Cu8/0="
								"initial x.cue":  "/c4loZsDZrfwCdVwnER2JsrfnEANbyXefAtvAkVsuAk="
								"another person": "OZT/sLgOf6DX4ofRqkhhYdRg+8y/4EUqAwMykoVSqHk="
								"fixed yaml":     "XSSFxzKt57S+rfs4EeckacJ6Giq/TL1ypLfz30KVvWY="
							}
							multi_step: {
								hash:       "LRE71JJT75M26IRI6UEQ8A7C1LV0L54T6HV2187M1H7BDQI2G200===="
								scriptHash: "DE9VH3D0G7UR7VTKS164SH6455EO8BDDJ06SC0TH6SBBKB4RMM60===="
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
