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
									"default output":             "0p7+s0Bw9rnP0egFS9V4TKcMqKswySrYXLcfrzkZajs="
									"stdout yaml":                "4Dw0cqStJY9j3aFvbHOOju9tGKEZZ5GGCD8dJI70LpA="
									"yaml:-":                     "5Mp7uZ9yWYGgmLMs1urjkGu4+b1GVcrsvXcPR6HAek4="
									"--out cue":                  "gz/wYY8l1USOyNMwlwgk4Ek0ptRhZp1Xf8mIQbKw4K8="
									"--out cue no hidden fields": "SuUs4hCUaFjn01mvRX5U02EavCQdJEVDrTXgWKf8hEw="
									"--out cue --package foo":    "uepXY6lU70GXMdvw8ts84benV6n9xXDqCxK+dOUohwc="
									"--escape":                   "fg5EaAHn7ge56un5t7lMnoFz4uJtwCf2zWBmz2D3Vzw="
								}
								upload: {
									"--outfile data.yml":            "LILHS+vyk/JYYVl2jO/pxbiKu7v+1DkUz70LtCiiOH4="
									"--outfile data.txt":            "H7OZHSwly+ulKEbx+Ct+ldQdeTaezNFbYwmcpKlp1/Y="
									"--outfile datafile --out json": "x4ETZ0MfMKZvwzLQdybIjJo+5B4qzWXMYAZKsdMFe3M="
									"--outfile json:datafile":       "zdzRdi9DNSa+2audD2PvbhqJWUn+vgnJWC3rGFlXas4="
								}
								multi_step: {
									hash:       "8RTR4UKO0PTR7A4RDTCQHMM08BIM862GRDC7UPVCP6BFINFIFNG0===="
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
