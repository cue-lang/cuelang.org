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
									"default output":             "oIlsL7u9dvkXpeb8gcPT5cTtkjR5vWv8RkE6OrqFj1I="
									"stdout yaml":                "GjD++//lXcv+uU6CBkzjQNPvRBQi5RstQp9pvu0DtNE="
									"yaml:-":                     "B9PTQebxPkKssEgzhdGVa+tvhVbcOQ12+BmHhbGNQrg="
									"--out cue":                  "zC7U370THOxjsjGFpzdAnG+CTpXORwdugxLnSztRg/Q="
									"--out cue no hidden fields": "6wB+jFiaZQnjxO4GY6dlq+srsS+dZVkInkH49DbbNk0="
									"--out cue --package foo":    "JWt/x/O83XsA9FdD/1IyLch4VLk021KX+uSp2QnayBc="
									"--escape":                   "zMrq2gp51cWlj8DtVBiT2dkSNGp5ltBQgL5SFPCqk6k="
								}
								upload: {
									"--outfile data.yml":            "NZCdry4V1WWrm9xczqH3beDNwORfhoiLxl48XHfcHY8="
									"--outfile data.txt":            "uUKtaGZs+Kpmo3+9RE5ckTi0zp1zowmrZWNyhU2Hs1o="
									"--outfile datafile --out json": "ng0U+DhWjUw77zMfDhoJH4CJjdcV84ggorjSuScyrSk="
									"--outfile json:datafile":       "lB8kgJ6IB0By6pFZbsl+gYQYZmvOpblkl8NkkGNNjXI="
								}
								multi_step: {
									hash:       "J1PEHEICTCGUDNL3RJF7QBHRFL0TCR0CDFICMOMK86CGUC6URSN0===="
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
