package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "lwwO9ElMhtLv8RLNW//12ona3seu+UGqm+2Bg8J5AqE="
								"x.cue":        "bPXFP9+b+VwX5Fdnv1Lir9O+jMJmK8zIIepVQXqKgAU="
								"x.json v2":    "JmmQDztWtp9bMcc9DAGOLu3Uue7F3gLgjm7WPorUGdc="
								"fixed x.json": "JYwsLhmZyFVW4VA/SiQEPQ0lsMn1cURoYl8naAl2nt8="
							}
							multi_step: {
								hash:       "1D1SPDDHEE3EJJVTKV39FMPJL5G6MPOJ32VE7GMHOEBQM5E62VC0===="
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
