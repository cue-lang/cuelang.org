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
									"default output":             "T042+KXxkulMgTdgxpIDLLFSTOyK0XSmaEO03tm1RIs="
									"stdout yaml":                "EP4uadGc8hYS8P/MURm1v1ZNjwCpk0jWaWvmTLW8NkI="
									"yaml:-":                     "b85lmTEc8ahjSE4TuvxnvhGEc4H9Ui4yugZhFFfoJ3s="
									"--out cue":                  "joX95i9qWKYZEfVBNL9o7narC0JXy9vZ3H58a+mLxgQ="
									"--out cue no hidden fields": "waeo0HywB63iWfyYiXA9CvadivLCBAutxxgl+q4/eDg="
									"--out cue --package foo":    "epQKN/4VnZWEiiYx7Yn4Ku16L4lUfYNdSIjdBsF+Mxw="
									"--escape":                   "jQUJ5QS3dl8rnbZjGfhLFxHmDqsBWn12LT9ffX/vlOI="
								}
								upload: {
									"--outfile data.yml":            "+AHwSYDUnYg+ok6JUVeWcp72d9L7Wdg9+z4uo9NkOok="
									"--outfile data.txt":            "VsfuY7m9645OD27TJaHmbpLFu2oFFtzbSm/wkaeYEkc="
									"--outfile datafile --out json": "K8wAHaA8XSSV8A6SX69mTCbyf0R9mBQLIFl1z6RfRyw="
									"--outfile json:datafile":       "w7CbQP7TZCTbNcrzX48DhKTKMASR2sV4F9SGmdPy0vo="
								}
								multi_step: {
									hash:       "MDH29JKVODAK81T1FAV88H8L4EID72G2SMO94SQ0QN883LATV2K0===="
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
