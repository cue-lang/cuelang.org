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
									"default output":             "sqigJ+1fNQhuMFYiQmla1ydVCJcwuf8VSrR2/17r+SQ="
									"stdout yaml":                "tq/VT/BAEzK9cKSW4cUt4HvONe2Kpk1wOLIxHbdUafw="
									"yaml:-":                     "FH5mzF7Et0eoqkIiK0pYhU1m+jmW/TtS+BCUQxOfGI0="
									"--out cue":                  "yegpOiHqo8W1ikwJditntpjJqdBru05J7BrOf+MxEu8="
									"--out cue no hidden fields": "QaA+CEe1I62ExcesQJObFzklgCaO8AB9FUbh6nHEYCo="
									"--out cue --package foo":    "KU5ePxsDKPx0PtvY2xvdavFDfCPpuxv6xWRa7dJFSE0="
									"--escape":                   "bybu+Np0M2eB2Wol7vcLNRYEBrWglPDUlBmfQqpzsHc="
								}
								upload: {
									"--outfile data.yml":            "QWVwnrBx1ADf4xmz5AdjFg6FTiji+4pJr8ngJ0Q6b2Y="
									"--outfile data.txt":            "CQ/UBRonsWcjXvZ9cZkFKufY6CSO2JnXq17Vp7rCrfw="
									"--outfile datafile --out json": "H7JuFzRWhLj7jik8GExndtkMdwOc5WIUO9t0JuPMyOU="
									"--outfile json:datafile":       "8W2lu+4fdeqPkwgKKDJhH7dsVkVoUCpXMj5dMG0GgQM="
								}
								multi_step: {
									hash:       "V8MM1P8UFU52F2NT1SK13CFSBCIAK3BFIKBNV5JRRGFICM470BO0===="
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
