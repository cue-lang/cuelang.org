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
									"default output":             "1H+E/lSo2zck9dW5Zm8GK5q21ibBotWKbeefuK/2LIA="
									"stdout yaml":                "0R19IYf7FK4ftPwsBGY+b2B0WmOy39cO1LtWfHZzd8U="
									"yaml:-":                     "CqLwlQL5YpqRKfLuJqtWyF5718me5xAj1yJfzUtH8lg="
									"--out cue":                  "GRmfpGeLBOqz3Q7XH6mrRGaesVYo7FMlK3s+F7A0qOI="
									"--out cue no hidden fields": "RKkoP01TMFfdu7IsGj/Qtpiat7Va87YCdx1mvuJmAOc="
									"--out cue --package foo":    "P+2sSKMuoqr1V4y2Rcg8NqpneUUBhVea1t/C1Y6b1LM="
									"--escape":                   "OPF8MR9W60OuSoYyoeWfq/RoJIVsJZ0QzkWyUR/BnHE="
								}
								upload: {
									"--outfile data.yml":            "f5NRaiK9zKjD9iP2v57pAIYSOLG1JUKJLXVCjKonQf0="
									"--outfile data.txt":            "RhbIOhw0EsCLbyMw1A7L1+TsapV9YKWCbRrMOnyG8Qo="
									"--outfile datafile --out json": "jVA0WzSS1dy3V9unSYvghw1tc5k50gv1l05UztlPhs8="
									"--outfile json:datafile":       "+cFl/YwMv113v4+6qJg2X2iVlkd7dz9BYrRh4cpx+lk="
								}
								multi_step: {
									hash:       "KJP9FHK0F6FB8DD0O3JM0MN85UQ1FTSTTD17G6D002AU0HGO0BQG===="
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
