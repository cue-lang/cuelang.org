package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "WRZDasZ0WWXOGBhasGUYw67ucmFBLKVgpdiTPLvdjSk="
								"x.cue":        "BLTl7Rxj7LamAD0Vai2YU5fnwKf4Y9hmdprOQF+UqTc="
								"x.json v2":    "oi1+n3/PMyVZ/baDShUoo0FtzPXFOjoe+/A/i6jHQzY="
								"fixed x.json": "oZJ0fOLaWpQrx/WCvEEEfEiLB9As5TT/ADWpaafIThk="
							}
							multi_step: {
								hash:       "0K3GTB75PL4BBOUC86PD0U3PSA2NU3SA7QL7AMN0FVIGT0BHK5JG===="
								scriptHash: "N4K2L5MIBMGPDN4PJC36DQRL6RR46KFT8DK3RM5CL1H3TQBP4U00===="
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
