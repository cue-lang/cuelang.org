package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "G88gCXEvhRAgVRe29WXnrWwk1xq51A+zaDtGaWh//8s="
								"x.cue":        "T4ftulpX48h6HKzlUV0WJw9F01t3kUdkL4Pf8Cm9+hM="
								"x.json v2":    "IjD/fDPCdF2LR6sPx+B9ytIuLqtOFHdlr+lhvJp6eRI="
								"fixed x.json": "KJi4gbt9Aj2Ks4FWAZsNQ+zrDzPP2hfshfVF70RwGTA="
							}
							multi_step: {
								hash:       "AVJLBSPOE6LI9VAQ0IGTU5MJAVFP26B0RL2KVUI0P25UHVTU8PFG===="
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
