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
									"default output":             "HXt4fZjGpDXjytcxt+rJC4vwQnW9j6Vr/A2zKqGWBZI="
									"stdout yaml":                "q7PapnsJBrZ52AuFd/KTekn20c25Srb5yfs7aS331RE="
									"yaml:-":                     "pD+GdmIvQ93hXeKmLew42MutjcXZnCLX4rf//yohOzc="
									"--out cue":                  "15AmFGkO1DR4KAGQr3/CUC3V5Kdw+9mU29vsS8RBfuw="
									"--out cue no hidden fields": "ZcWlKpZTD90Ol1g4qsgoIIDFssQltTIQx3R7mSNZZkI="
									"--out cue --package foo":    "2/4CQyuW381CoUD0SHbCv37kHXIB1v2AneB2NCnvWLQ="
									"--escape":                   "ftCoWKsVZU3tpzi8QRfs4glN0SOqC9qqGsW+vxqXiSU="
								}
								upload: {
									"--outfile data.yml":            "Sl8wu+2zq4l7afwvRypVqlP1Buy+hs3FzQ92K9Zsa8E="
									"--outfile data.txt":            "3Bm5ErrseB715CdBgPRmW1HJhE08h6fH2v3A5Vbwcqs="
									"--outfile datafile --out json": "27KN8N5liX97IlHii61P59JVCn/rzVWsfhQTzVdT5fs="
									"--outfile json:datafile":       "gVyhCVRzGKe6GV1QZYLY1quDzOq22o10Z5mVGLdX/2E="
								}
								multi_step: {
									hash:       "QMEFN4B33C5M47QORB14DN1G9LK6H16JBJ6CB9VQK2B1QN4S2NSG===="
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
