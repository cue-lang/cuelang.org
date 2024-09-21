package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "9U+SOMGmVDgQjhyLTEOwWzaDkPhdB+gieOYR+QJ2uiU="
								"x.cue":        "6ZpDDnGncj63/S4RDaqBwVqD8PeW6iIMkzBJx/5EiYw="
								"x.json v2":    "nFrrNUDEvK46aLHpY1J4Ol9oUNKVOwysSrneU6Sb+94="
								"fixed x.json": "GzGFVFVGGxCfaB8is6ayrk+JphDtd7KKQZKqyXr+jtI="
							}
							multi_step: {
								hash:       "L7536V67HAR4P38MMGHB6J3T80AQ82IUPMSIIGDO2BRVDEK3RMF0===="
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
