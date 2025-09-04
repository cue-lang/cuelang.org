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
									"default output":             "w4bV3G3Y3nKxX3hv/GpvloO9hqh+ki7JC9n3L4iBcjc="
									"stdout yaml":                "ssZ9H0NWYbGHEccSXrcZokU+tY5ieW8EL7XKdL7RQbM="
									"yaml:-":                     "TbhgLK3eUpA5e+YKjhmG84MEBsjll5L90dQ5BPboUes="
									"--out cue":                  "H9ym+Gl7NYhaHzvH22vxFle+ZsNDKtqExjXMXn3EfFw="
									"--out cue no hidden fields": "/3QLnW+pnJ+BbIrclPumdvVNoEMj0TXsAZauQPO8dwA="
									"--out cue --package foo":    "68JojrLcxS6h/r5Tc7GTe2Z9F4s0juGdU0F/Zes7n3E="
									"--escape":                   "ruvjOh2r4cRnSEEmcOv/yTINxIppAKZYLUNtdJ3E4nA="
								}
								upload: {
									"--outfile data.yml":            "8/nfKrKxoDzBb+CI52UAZhgNN4JQE1U+knZu8Vvw2/k="
									"--outfile data.txt":            "DJIZy3f+6kaGUNbXFzt/zmDQtDbdRkd7uFAcVDZNjdE="
									"--outfile datafile --out json": "C19Kmcsc2cVbRXVbqMHoUPiWgkyYSX88UFpYqEEMWj4="
									"--outfile json:datafile":       "hkX+MyhscqGozqgFOxObcQk/XB0ZxPRCaG7n3zWJhig="
								}
								multi_step: {
									hash:       "93PCEGPK784MPG06CVEO4DTEHMJ9SEH2I4VMJ7JMMEH22NS1HNF0===="
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
