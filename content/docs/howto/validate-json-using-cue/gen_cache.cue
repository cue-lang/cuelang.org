package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "TfWWdKecH/5+joGj+4H5skMUN1woctjwkEaP+jBpfhQ="
								"x.cue":        "vMd7cPTZrfAhs1Nkpx7ZAns73P0nw0iM4gI9x4ZK7Lg="
								"x.json v2":    "Q6EX4YtxzB0n0jsYX+Qkq6s7YFrQbCMA2eR4j5FtL+E="
								"fixed x.json": "ZNeOA+JbnHDiwanYOiORTSrZTpwwa1Sc4ufJMsWTNNg="
							}
							multi_step: {
								hash:       "9N1J4418F1B2CPBU12NSHJ0QAHGTG3Q70UV1M8CRIOLRS3BU79GG===="
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
