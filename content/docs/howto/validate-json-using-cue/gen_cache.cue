package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "3NKDz6q955yJFC9EUOKJG1m//Tc3s5rWzou//g5RA8w="
								"x.cue":        "FSAKqWV6m8TIFhWhZOzY8ECclfsOU8S8tt+AUllfhB4="
								"x.json v2":    "5d4+kLUviq6XXDK5ISq0dfA1zbjRtyJbVLZvDtwmHgs="
								"fixed x.json": "vLn8tZu80YREYSfp2M1VskQzwqMwJ+x3tMHQzaTnnz4="
							}
							multi_step: {
								hash:       "VES226KOOGV99PRL68V5HC5AVD8RAU10RUH7M4CD2JEQJI4B14E0===="
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
