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
									"default output":             "QoO9madUSdFKMhchJTHc5CCuxdgI/+ET5HAWtAiFiK4="
									"stdout yaml":                "o3eYLQLIHjrbzvAvVwO7i2/VGNAMK7y946Z1M5hA5Ic="
									"yaml:-":                     "2Y1gMrWfhmabFzJTQygmuXHPKTtYQ49JOOVdlrvOCE0="
									"--out cue":                  "cpXraOI08SFfMHkOD+b4pXQKb0xOkYewNJfCuYbIJIc="
									"--out cue no hidden fields": "XCZPvaoKTCi1xx5hODGmirkZZRR3uFDr06Z/Lx+gz0I="
									"--out cue --package foo":    "cx5dc2KHivDvHyogOvXtZNpdmBYRf/+wBq0ZrIqqLtU="
									"--escape":                   "X2agO9uO7958ORkA1goq8WwTetvdz2NhIWwZjuPrttQ="
								}
								upload: {
									"--outfile data.yml":            "ClywIVwBemYDkGQ8Yh1B0bBllxWLNYJW1iHA7zStKkA="
									"--outfile data.txt":            "q0hl/QPF6PGYuLNCUK/THsU20Xb7k61Ut4RJOFNVZcI="
									"--outfile datafile --out json": "1aIqniH1S2ozfFIFfLOVJpkchLp89Hh6rVMtEdL7m1g="
									"--outfile json:datafile":       "FpFDdPGyrH84pq94uc/Xbs0nFVrvOOQapgY69zABFPA="
								}
								multi_step: {
									hash:       "0ES22SBUT3J8U536ROBLEMC9SDFNQ2LCP87T8BI61KTS41A2JTS0===="
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
