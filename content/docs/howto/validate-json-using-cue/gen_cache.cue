package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "13X23ZHobkcNA0CuaztG8baRvl5b+4FcGrlx03RP/hI="
								"x.cue":        "2/upIB2uZzjc4h6db+OYcdqA3PS7bvyxJp3AIlg2p40="
								"x.json v2":    "p0YgiApf2dTVFKAGZrRu2zYXGKK4CvFX1Gict9I7WmQ="
								"fixed x.json": "Y8o9hES9K1kBVQRnGdL/hxjrv4KIcmaJwmJ1FGRnbAE="
							}
							multi_step: {
								hash:       "SHRS8BND3KVARCFJND745SB6UKLO26UOQM8VQ99CC3AR2QLM92K0===="
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
