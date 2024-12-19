package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "fIp/rGd/UWux0yL+Qk8NjeiTgpjgCrux6igxUPBua9E="
								"x.cue":        "AaUGBW3WKtMHjGlu55I+Bz0e1fn28iNBMmDWVgpRR4U="
								"x.json v2":    "ELvOUaFu/Bv1F4woJkpcEJYNC4egT52/5Myq19xnMR8="
								"fixed x.json": "V1KEoF5ts6l+3pFlXCYVWGRLdLHtUXW6AoQQ7f4YBd8="
							}
							multi_step: {
								hash:       "4Q5L8KOB06AKDT6MQE3Q52J5UESOI4T5E10J08P5KIK44JGLC5P0===="
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
