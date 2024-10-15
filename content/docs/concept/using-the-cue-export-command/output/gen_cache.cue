package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "VqHaAhqZAragy3Ahee3xK508n8BzwiDeCtBrM0gI3MA="
									"stdout yaml":                "9VWeucrJUJw7WoPFMMETxa1HgIZZW499zlkxHf3owTs="
									"yaml:-":                     "Mz3smFpgVi4lVJelfiH5hW6/6udaC3evIs3HuYJ2tig="
									"--out cue":                  "Q+AAjKPeDMA2SKu+ytVSvVZNFtuzks6rpSFY1RjyYGY="
									"--out cue no hidden fields": "dwIQIMbyVbOCodKypWRvuyoZF5Oyo4YENEHjKM0B10k="
									"--out cue --package foo":    "rQBw18X4V2w9uw1oY2vouMw95G2l859whbywrsIceeA="
									"--escape":                   "dhkUj+tNxNuNMOa649+C+csTaIXUhJ86QxuUCDBGfDE="
								}
								upload: {
									"--outfile data.yml":            "XZyYZ++8Lo8PQITgdCkafxx7LE44iYewInHmtg6DQfM="
									"--outfile data.txt":            "Igh3aignbJ3FZXYFnFmnpoX3Nc5RwsjDHVS55cMZH1U="
									"--outfile datafile --out json": "KXmc5Iy/afoa3e+DUExzOuzEHznfQlkZAnroLMtDEic="
									"--outfile json:datafile":       "IvhnEmmsG5/r4q6+DObfM/J/91HOOuHLsdjUbltTCCk="
								}
								multi_step: {
									hash:       "A21G38L4BT9RRQN28J6D9CLOJSP0CQMT2JOSI1H056OVH6UOLGQ0===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
}
