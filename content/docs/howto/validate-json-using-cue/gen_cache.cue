package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "TDvzTmPQy/8qvHNphbj28DlVaH9i85RhUiqvynSd140="
								"x.cue":        "g6lYrdh8Qvj83Qn2qaI9m76SeAcYJYDsEu4zNTSezz0="
								"x.json v2":    "m8PvC3cSMw/jdVjZby+q2NYwxjlAh157GdnqpteXdKk="
								"fixed x.json": "SYqZl561x0xO7T2Rg/AAr6RCHR/b0Bo6zwBIb0dnGBU="
							}
							multi_step: {
								hash:       "86CQMURLCQPJJR7G45CT8ARME7RNCU17D87D76UBHRNFH225UHJ0===="
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
