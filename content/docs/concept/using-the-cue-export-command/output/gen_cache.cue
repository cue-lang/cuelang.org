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
									"default output":             "OdlAJHlGCZAm0Fu3qV87yNcxHQ/w00YbGf0TRe4gTrI="
									"stdout yaml":                "gx89iGPEpShY23LVcXT8BffsTBIIcmCmM3ShkkpLdsg="
									"yaml:-":                     "/RghhRfaaz+7E8SeyiJSa89JLadO5OlCe1vOR4vTVxY="
									"--out cue":                  "eNlETjR0nCrz/sRqEGpy7+/03yzGLOhLJtQtjDIkxy4="
									"--out cue no hidden fields": "Q8MVmFSvM3C/weGGVzZNUZZWPgZ91QK11A8aoOtbYNI="
									"--out cue --package foo":    "7i2b6K9+Y4CvI5kNGus9Pn3Lxy5tBQFWBJZxQnU9Skw="
									"--escape":                   "fmUHwO2ftjg/uT6U1QWc0remhdH1GKAR/Q/9EJzIWLc="
								}
								upload: {
									"--outfile data.yml":            "TwsYISSHVvrbcJlpTJTx4gJVBOv2s6czsdjQlvHXNcY="
									"--outfile data.txt":            "B38TZEy9vwjhp5yvESNOqoo6CePYEwLS70RBKsVsAQM="
									"--outfile datafile --out json": "qSpDbQ8ODr7qIN1BAcrKxqzX1+v6FtB3ey5PpnSGO7U="
									"--outfile json:datafile":       "lYLyVui6aXSlSsVGRmeochgxjX7kreM/JWstbWzkQlo="
								}
								multi_step: {
									hash:       "N2JQF5C9CHBKCGMRNKF6HPD5QR5HPLES4SSU6MA7OA97IS79SRD0===="
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
