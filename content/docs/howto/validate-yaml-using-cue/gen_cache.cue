package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "dYnS7D3ZEKFKCpFhaQSukRQYjP1lZi2n8ybD561nraw="
								"initial x.cue":  "C4bmkmp+8m2dDYb/HTBF/BneDijxIx7u6/ebuxDNfVo="
								"another person": "/BbMHlii3RLmDbhT1XcOyjD1+DN1Yf1F5Y33YS6+S20="
								"fixed yaml":     "Ir4q8zwn/YBnQ3wGP8Yw/7KKAnfGG3gMWTomTu3MnkI="
							}
							multi_step: {
								hash:       "ARIAHV387MU984B8FHKTVE5P81DU34GGI34UAS0RUJMKQAL0QHI0===="
								scriptHash: "TKKU7JEF7ORT6L9TSNKD9P5J1GDTFLS2HIE28N6UHD5PJ68NL0P0===="
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
