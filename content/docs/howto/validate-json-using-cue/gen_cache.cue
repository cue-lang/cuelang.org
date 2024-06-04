package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "8ufo4jW9cssylpN0tckRy54t3VSS1PiOg6hD0ftVWt4="
								"x.cue":        "KRcznzGKmdx6euX5srUxpF7Ipg94WvuKHcE2ZZPNpxg="
								"x.json v2":    "MXIKWcBalTvnKB9kbijX4LwXA004qar7dQn2Q52Ldh8="
								"fixed x.json": "Sz6uqKijrhvu3eGleC+0Lq7DW6tGbZy+pXt8yxu1aek="
							}
							multi_step: {
								hash:       "UFHPKFTOUV7GJ6TEGM96UM2VTRP5NPKM4EBKG9OGG830CH30O34G===="
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
