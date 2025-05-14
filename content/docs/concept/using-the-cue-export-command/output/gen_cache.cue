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
									"default output":             "hPDU/TV2+4b0xaPtO9MPf6xpL671MvmyX4FkkhCdm7g="
									"stdout yaml":                "gAfmhmTyi7P2391HSWvGbScUFZ8O+iP2YQ+tQXU+YZY="
									"yaml:-":                     "LWgDU8xYP0r6+/Ujnd8seRhujig69EogmOzbyhRmBgQ="
									"--out cue":                  "oUmAhHREkumBAkfgBtxy5i5uqyOT3bNrpoPFBoVmD98="
									"--out cue no hidden fields": "6tboTb2KsyDwl0sP48wdx2Ji1WwYH3fwoxw2hw2xonw="
									"--out cue --package foo":    "rk/U/LtcZPZoxFgAL1t6qZDZkEqviI1MRljk45Mt2iI="
									"--escape":                   "IW7El8Qb+YaxRF3945DP6zUZx8a0KTrc/fe3/aEJonA="
								}
								upload: {
									"--outfile data.yml":            "xRa+E5jnIgWrFfuZt2DwFXrOaJFdN6CtQRq7GAsiutE="
									"--outfile data.txt":            "v0VihGoHOJ4lTCfBuVZqQbJ15vmeogikDDjM2rqby7c="
									"--outfile datafile --out json": "IPfkSiTl3ATaJ66oPaJfwqTwbotXPx3V04tEwntDkaY="
									"--outfile json:datafile":       "CDylnS2nx16TaX1fgNta19hIFjhnLRpt9hsWrnNOPFs="
								}
								multi_step: {
									hash:       "71V3GG0VESBK3H8JVBGRML765QBUCQG75841P83R772J6MUJ9MR0===="
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
