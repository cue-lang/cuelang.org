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
									"default output":             "Q4x0kQNG7LbuNS597cDoxncHhPVUAEZcKPs8eTSXH6A="
									"stdout yaml":                "VgMHNiijIX3yWyWDB5evjUdNHrpVGLgWHAMeFim9Y88="
									"yaml:-":                     "etNN4707N/bWLSAbIz/WCB8ayNDHxXghWonZN476voI="
									"--out cue":                  "QU0QvWysJ7veOM9Nuyeb6bWi5FAI5y1YTQtdvNRYxUQ="
									"--out cue no hidden fields": "70RHmDb3UaG1ix2ecSrPx+NPhYk+NeCICFNirxA+rKk="
									"--out cue --package foo":    "tUdodtIB0w+FrvGIyQjSVWAd0GLtNMc4QLTBXTSiNqQ="
									"--escape":                   "6gBqNXshqFy1utYx1Hf1o9+iGUtf+1mhlxflmFrcMnQ="
								}
								upload: {
									"--outfile data.yml":            "03qOnKGbCzHt8LpNIg1P/ykvXydnXbRdBOnd8y7eOfI="
									"--outfile data.txt":            "aaLNvivJZgUTxSEPVBofjo9lUfXdhGxcH0sBD9FZcjU="
									"--outfile datafile --out json": "DbKeGvaYwU1LSs9mKWNIvknrGlzJa+h6kkux5HcBi4U="
									"--outfile json:datafile":       "L+SAWgmBTD1pekp4HhREFZ4IfHzzqwSeVNHzGmShZqg="
								}
								multi_step: {
									hash:       "6OCB1O8AJ9E4B3BL5PALR9A6TMTPTPVC6TQF26KIKMS0QT4D99PG===="
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
