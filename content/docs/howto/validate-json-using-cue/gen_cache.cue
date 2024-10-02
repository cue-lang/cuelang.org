package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "hVPmdyayeSbuO5dOs5gwyWAwfQURrBBfiTJwuvyk4Y8="
								"x.cue":        "FTQTbEenOqYVqTUpKxmFrlBQthGiKi9rkuylsVnwH6c="
								"x.json v2":    "dNwojdkODcdBL6FKWAllXyfx6sgfCIKeQ9GXXFNmSy4="
								"fixed x.json": "/IMd/OCSSCzC5phAXkEWh0+txsQsKylKKpckIGUHBHc="
							}
							multi_step: {
								hash:       "TMGC6LLCPCEJT38R4JQAAEG0G1HIB52KMFLOQORA59RP3HKDPLD0===="
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
