package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "jMEiorgsdmeGm/lmOaPKwaaRezkGI/CmOaM+//jMDTE="
								"x.cue":        "PmLhySGIO7eoP7ev+Mtcf8xUPu50hYPiZy5XtCTDxSk="
								"x.json v2":    "l59I2UEJTj+/wcHW8gcXpmdLdAPvDs3dNQljPKJuQsE="
								"fixed x.json": "ignY7Yj4UFq45HvZG1P2sRdFFpT7zbKsvKc8ljmNsCw="
							}
							multi_step: {
								hash:       "SG4HAOI7070JI0OJMOCTFQ2VSNNL9CKCQ8909UO0PJ6UKHL8S5FG===="
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
