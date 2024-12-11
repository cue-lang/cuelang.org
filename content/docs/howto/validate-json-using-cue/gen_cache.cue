package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "/Nv5vy2s9yu1eCh8OYN3vCJ7Q0l2YH9uhN8YxBlYpks="
								"x.cue":        "GWrQkB0+L/mxBrCD8kY33tVw2TopXw/VEKmW8khFfn4="
								"x.json v2":    "7+nHyhl5dE/ByKwZg7IEHQ4hLSy3CGd2JUHnTFfOg5s="
								"fixed x.json": "UhM3J7+Y/vu0FYxk65g03jtv3un/7BDhI63hS0tD400="
							}
							multi_step: {
								hash:       "RUJ1QQUAI3053OMA79IMG5LR3SAING3CFPPIEKO4BL1N0KJQSGR0===="
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
