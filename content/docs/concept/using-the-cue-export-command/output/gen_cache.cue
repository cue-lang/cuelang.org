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
									"default output":             "n3rAVUfS+hzqwJnj/BHRYFgKSpkndlyr8hLpdqU+01s="
									"stdout yaml":                "XhOfgyo5yVZAuPlF6Kvm4pu72iyQ/5aMdUk0A5JJgZI="
									"yaml:-":                     "Flo0FoaZrhX+G1KR3z5l0ltuQx9u6BvkLAXAG7NRq/I="
									"--out cue":                  "Oz1c0LQpCBliFkHDpipfVxJT6aN4npIVIfxuD1Er3I4="
									"--out cue no hidden fields": "t62bJ0Yk1QeHFNRgIYI0G3cNnSHvQxYXNjByN4A6qkU="
									"--out cue --package foo":    "pzuFR0VsHWb0NcawKfzOdkkdZiVogmkzBlKo1V+A7Nk="
									"--escape":                   "Spgr7rvTDAYOdaqxMdkNoRjNLWQcD9ILha2oNnKaDEI="
								}
								upload: {
									"--outfile data.yml":            "9eOJLBIFLiMAbYJy55HkRSJL1zBC1cJJQjCW7R+vo/g="
									"--outfile data.txt":            "yXmtRzb8AER3Ys4BExc52AdT+maubnkhTjgyVp5ODHs="
									"--outfile datafile --out json": "0HNsyzsmviQd6NLpMYnA1zIYEYLjeeZ06TWvIxHncK0="
									"--outfile json:datafile":       "O+51NJeNKnrr4O628wmNwpHiGviiq3RuKBbJ7NFCvCU="
								}
								multi_step: {
									hash:       "IJ7J9J2DKGNRMM7L42POLG4N0Q0EPRUDCICN9961EQ8FPA59G210===="
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
