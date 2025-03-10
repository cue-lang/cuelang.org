package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "6yWA1+t7yxFOCj3buNlog2nMwl/yrX+jOBITYF95X4A="
								"x.cue":        "JxGbPpHXi3Q5eGQQtO8OqL6kq9/T891kD1+vnh54TUs="
								"x.json v2":    "fqnohUH13eTKogw2TaJ/Cw//C1olig8b7wWezZQpMq0="
								"fixed x.json": "jeYVYazP5QeAqUZSIwheQwP999acdTTV1JveRy3e0ug="
							}
							multi_step: {
								hash:       "2M4GREOLLMR088DFK3CEQB41HTQ4M2958CPAEKNB6CAVBV0JFP9G===="
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
