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
									"default output":             "7eSsMsKCHSZM1ze5BfsT6DKf5HtSD2NMt9xpkW9jIHk="
									"stdout yaml":                "R16+HYKYR+PNrrERBukrR2QdNLDxqyy2SreqeGsI8qc="
									"yaml:-":                     "b7Ug26BU9FPLjKSM1nbtqeWCifM9Bmm7zOKmhwaFp8g="
									"--out cue":                  "H3wDnYkcFwMzbqfp976P2OaA5q90Wy/Fsw3f25+a+2A="
									"--out cue no hidden fields": "dJj5auHA/M6Z+CgqBQO+bTiB+wCVPYEroBpuTaB2G14="
									"--out cue --package foo":    "40dhg8IAGhGZvf3A5jrZjdRZfnDrhNRKozoPc8K0i4k="
									"--escape":                   "XV9Fc0Soe4fQjPj/7EGl50wGKy0GUPcM0MzNNGX/CZ4="
								}
								upload: {
									"--outfile data.yml":            "xr0hCJVVgnu9NR0X9kiKGKWdzcvPMEpd2O0NVGA59mU="
									"--outfile data.txt":            "mYlkPj5TABTFuVzVdPgk9jn2WaKRIgh9btEInAfH5i4="
									"--outfile datafile --out json": "Pxl1ggXFXxHy8spZsFG6PgxTeCZI40Hh5Fpe2wMuyS4="
									"--outfile json:datafile":       "BuvNzFNjl3nn4QPsKtYv9xcAz6lEBPLluD/0+I8eepc="
								}
								multi_step: {
									hash:       "853LG2D5SM8CRUQGOCRN6CPKH6POL13U36ES76CBG7V88I4F5BV0===="
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
