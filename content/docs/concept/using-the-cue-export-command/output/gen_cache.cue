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
									"default output":             "rl7KJbLbLngokefmQ8EeidkOoKoT4ULW/4YBh2ZPqWs="
									"stdout yaml":                "yws2oyUN+QZEZophjZYfT7OaIvyqBvwrebfR/xeFSD8="
									"yaml:-":                     "T7xCVWVBFlrVEthvgv3BajuBSy9sTaHNqEkQRr8hbmk="
									"--out cue":                  "TOZVfdRjaVRwV3zxgjwbNnECDGrGAaqRBJdXr6rmMX0="
									"--out cue no hidden fields": "PocyICou/CVaRLdc60bHzmYxxckpfx0ThXiB0Tx/uk0="
									"--out cue --package foo":    "0D9wVtXu2/e6+Z0N9k5D045HZ0dENcnIkgH9IB782bM="
									"--escape":                   "7Sr7FEFcJme+U6f5mGIudctbaGg0hVUgTDPaA4SBhl4="
								}
								upload: {
									"--outfile data.yml":            "7BDeZK+/eDiAwvLGVeNkKMegC3tzXbifmb5MXYCwYM0="
									"--outfile data.txt":            "UTXfQklmOcdArxjK2YZUbfLDYsWWyYVSJHV/oIWs/Oc="
									"--outfile datafile --out json": "RzPL0Pp9cUO2xQxP5hPVrGPDaoIUcdzOj+QIMDWiceo="
									"--outfile json:datafile":       "poTTk+O0DAOkyvuVb1Zi/OKKC6HmtMQCknh/kSvU85k="
								}
								multi_step: {
									hash:       "T6K33N7HTOP2IDPU7K7LTQQQ8IRQ0T2MN8N8OBROGH0BBPPJ2KV0===="
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
