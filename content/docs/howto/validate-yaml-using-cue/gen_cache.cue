package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "VnqMyBAoik6jq/O2CMLApa97ds1vcr5f0OgVg4qGyJs="
								"initial x.cue":  "0y136beRyVOY5yvXG2SV3ewrti2WDco8H4i06TaMhgA="
								"another person": "gcmqyDUkgQJEX1RNMO+BEosOLxPg6E98RE4tvC22wtc="
								"fixed yaml":     "xmhtfyAgJLFF5qw91jGovbbT0YGmQBSW4kzB3RAA5Gw="
							}
							multi_step: {
								hash:       "E84685CSBGOD83SM6I8S0T42B3G83V8JTEV4J81JC5AFVSHE91A0===="
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
