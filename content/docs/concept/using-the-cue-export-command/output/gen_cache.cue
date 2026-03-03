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
									"default output":             "5P+u8RbXbiRD7dQaLHdGhuGIFqxvYqMkxndCLhuk+0Q="
									"stdout yaml":                "ezlXPS4AGOyRXrhZxBCAh7g3VVecSHNrsQzmqgXjYiU="
									"yaml:-":                     "MszpCQDDnTG3mvZs8qzbESu3uKQggBcquKKuarcgqu4="
									"--out cue":                  "h4kchv+lJwpMrBSkHMLQLukFrPqs+yNq7ElKRJbDBOA="
									"--out cue no hidden fields": "iE+tFj2jb43rrcCalLlJ1ZbmBajVWGwXWE52uJBmdw4="
									"--out cue --package foo":    "cFcc3v3z8AzFAHiYApU8XgNMBFdAGAWHxTqRmlxgj1M="
									"--escape":                   "bkWYMe8SWDNdMywA9Y2iM4HEa2D31Ylj7wb+19FMKhM="
								}
								upload: {
									"--outfile data.yml":            "bHVQTdnDRknHUneIQBwwt+I/Sc+VUuQc1sBO9B5teDQ="
									"--outfile data.txt":            "MH0o7i06I/r5f9QmQ1bx+pbQhbVOzWEP8HThwIlpkJc="
									"--outfile datafile --out json": "xBgnOdGnn4Kwl3ObzrNBBTMTlH8W7GkQHw8E/8gz9ig="
									"--outfile json:datafile":       "6PajMpXq9g4z2+FnphI1cj2Ie4hr9YOp4JHfgbCLo14="
								}
								multi_step: {
									hash:       "O9P0N8P7JTH0841QNS4D9FMALSMETEM870KVOJCMDELFFEMLN96G===="
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
