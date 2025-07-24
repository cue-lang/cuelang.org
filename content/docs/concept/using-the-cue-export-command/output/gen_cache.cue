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
									"default output":             "vDpQFWdARjFthvIp4PMTAy5YDmIpXOq9wQz7u+mq0Lk="
									"stdout yaml":                "noUgvRexUNUZWC5XKerLN70DnDO8Sj1V8r6pVLcuGUU="
									"yaml:-":                     "lOFqN1MOAIUNc+jsEklK+SD5jonOpPCpUpT1yiTSmGw="
									"--out cue":                  "9VuqbaWLu3N4IOfTp4lMMs+AwFg/7tf7HpXjP3RhXJw="
									"--out cue no hidden fields": "NcrHFf8CD957uCxPGAP3ucfRBNreLQ2lP+HOT5V33mg="
									"--out cue --package foo":    "B6/kw9Fb3qComNb+HQf8fNb+DtSPqQwZMl1OBnRaBgQ="
									"--escape":                   "pDjg80LzpR3q78j6zvkRo5U5iVrgEJ6pWfEHsQe0KKA="
								}
								upload: {
									"--outfile data.yml":            "gXdqwAxnUgUSOEbwioPZE3+utw9q4pxzzR8x1DeMk5c="
									"--outfile data.txt":            "m08bbZt6ldHHqj3BYs8p4+18wY1+HBTbBmLm516Nggc="
									"--outfile datafile --out json": "YhiTUMbkdQfOk+gdLo0fP00Ck2OP7SmIkZMJgLCTOBQ="
									"--outfile json:datafile":       "wYKmwe4qW3gKbGcDG0yAbg8J79g/JuVD4m3Xq39QxC8="
								}
								multi_step: {
									hash:       "6IRTGMD6AKMIUC96SVHPTPHQ398Q7M724LNCL1O5JQ5P73GDMG20===="
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
