package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "pAJed9g8iBtuQUiL0rykBMhottYloSkS30sOVOrSzQc="
								"x.cue":        "cBuOsBn/W9yNXwvtiweiNdKEqhvRyclRxRX1xNUAvKI="
								"x.json v2":    "L5P3aKoZAjB64K00R48E20fgkAXnqCpQzO/qb6GMvK8="
								"fixed x.json": "lhkNcEVhPM3CZ3GiO/ZHNaDFSaA5psol/2ErGlbZ4ZU="
							}
							multi_step: {
								hash:       "E4HVJ4SO7BMMNV6379BFRR08CG3M8L5N7QJ3UA1UN3VPLSU4VQRG===="
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
