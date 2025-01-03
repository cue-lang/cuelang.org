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
									"default output":             "X3PxazbN+iCnaILRT4U1M9GMUO26O7xfUZHv1NG4he0="
									"stdout yaml":                "O/XUxYvPcr6tFJR7fQQtTIO59yC1E9Tunrzxvcr7TNY="
									"yaml:-":                     "HFVvXE3zKapakcBEZWdeL47cDQcNjBvRllgJ9og9jDI="
									"--out cue":                  "whz56zvgH8OExfUdM1aCHHVcTnMxrU2LMDnY/N89hp0="
									"--out cue no hidden fields": "fUBOvrucypY4J3JN7W3/PZzC3qcuJlYQR1KySp2t4Xg="
									"--out cue --package foo":    "vGZrIa5hAU3vcKDnJN+VHxkBqZ65A9nTlS3ASUmeybA="
									"--escape":                   "aOC5FjaXfxAM/n1RZ11KDWrNjrq1TPyRo2qmEszf+s4="
								}
								upload: {
									"--outfile data.yml":            "Xs0l8QZniduCD1HxUeBGegdPzSaJmYXIC7FgLZPpMlc="
									"--outfile data.txt":            "Yo7xCJXZHhAs3XLUTqABONOlD78HdVHUyLLHCxxoaT0="
									"--outfile datafile --out json": "JiP3810IMPFpLDOGUbI8DrqlrUD3AwqGwxn3I/tYkeo="
									"--outfile json:datafile":       "u7/eIxtwLyGVwvb3ETcE8Hrpeh5EyEYeicT7APAW32I="
								}
								multi_step: {
									hash:       "8K2ICB34R87H2M28D4UR1NF12MT85N9O3D49PO9TV9OLF7N8G9V0===="
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
