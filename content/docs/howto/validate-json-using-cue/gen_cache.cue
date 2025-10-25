package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Lcbo6IGK2YA2Ki8eVx8boEdUg1Se487JRdxRRabKlxM="
								"x.cue":        "OvIvnvG/MwGITl+bug8+R4jYCaVE6hQ5Kq/kT3ZHxFM="
								"x.json v2":    "1e59UFy5VFY1hv+ag0BDsrB8RC2+tpsLmqpnMHfSW5Y="
								"fixed x.json": "maVQdZGoCCYbH/o3l9pKhmfV9u8nUrk1hT8/RUaQlI0="
							}
							multi_step: {
								hash:       "HK17MLEJVHKRE5EOK90I8D3PS9BVES277PA60NEFHJ2OVH9MANNG===="
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
