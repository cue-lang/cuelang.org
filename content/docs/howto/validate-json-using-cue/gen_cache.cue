package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "gX5+SA64nsv7fh0l2+fqyCzqDKp4UhvbXaFW0zLeSWA="
								"x.cue":        "cDlGl3GIC22UsD41xQDbpOibLdq0xaFcn9hkuNpypH8="
								"x.json v2":    "SxVV8Ml4Wd3wnq5OjHhkCQ+eYdHWM3mUSpI+VIAaZwc="
								"fixed x.json": "ywEJCMG4t9+GwGcn97v/i+8PCcf817BlMcvj0u9fXyk="
							}
							multi_step: {
								hash:       "A0LR53J7LU9DNTO8K3Q8AVNV298887ER53BBDIST75L7CJJ4UQ7G===="
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
