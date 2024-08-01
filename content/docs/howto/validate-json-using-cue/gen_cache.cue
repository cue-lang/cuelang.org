package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "W7IkgT1phqzTb6rlZknic9hmMFopvHwVwk3EMWvP7F0="
								"x.cue":        "XIYx2b/lc1nJXDpa6NMlExYTbj8xYVUkCTjkVBh5Pb8="
								"x.json v2":    "5EBeyykHkCIw0W6o87rIldHQ7oGSEIU9K90KhNpTl4g="
								"fixed x.json": "lmDV7qpNHL+Q0NRj65WqZlSdCHItWyTeHoJh9OYiG0k="
							}
							multi_step: {
								hash:       "90T343CFS30GDJKL6B5ID7KA67E1DC4L0AQTOOMGI286N0Q4IMP0===="
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
