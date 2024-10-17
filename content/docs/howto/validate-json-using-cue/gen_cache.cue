package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Q6TREr/boqoRiBVQn1ONLNZ/HbEoF+JuP1XB5Im9ibA="
								"x.cue":        "8yu2TDvvzydVS88bv33meBBb7N2B7Px/6grrEQlwLQQ="
								"x.json v2":    "8F6KMknxPwlyaJONNr1YDgN0wwsnH/Li0sNT6KFessE="
								"fixed x.json": "E8lSYfahHDTWn+nYU+BbTcbyLCOIGYoFxXULFLBCjSA="
							}
							multi_step: {
								hash:       "RGCGSHJF6G1EU3JBGGU03OTAK2BQ6FNQPM6AJD9024AAPKCFPEE0===="
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
