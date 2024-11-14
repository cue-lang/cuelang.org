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
									"default output":             "IBo9KvRiEzSFkgwD8hqVstOw026YCvcDj+4CTfe0U2o="
									"stdout yaml":                "AiN0SYk+Np+XZeYr2Xv1KT73YIL7VWPdIFgmDkLXZW8="
									"yaml:-":                     "JSVG0hFXKwOZthE919vXCHDykaG0as/S3KIkzfMvMZs="
									"--out cue":                  "lTNdXbyXcFd4XnivJR+pqFPddIn1kyvDx69rTWFqx64="
									"--out cue no hidden fields": "pw2jD6G8tLxYjIBStVvv01AfycXz0nSDqGtTI/bDRxM="
									"--out cue --package foo":    "e2PepQngSnNAkgqaaCxjzV8nS+bGwKW/HbD1Wj/17Ao="
									"--escape":                   "wk3J6qcNKEntJfPsephfZ3+ppQ+5db6wHdveuuGvudo="
								}
								upload: {
									"--outfile data.yml":            "ORSv8dK6s6mrTn7+Nn6lcFuD4xUzt0ZiLV/Ll+HQRzo="
									"--outfile data.txt":            "4h0DjS2+mt+rcLJ77Yfo7LkisEROXTWq9hyUf1rNSvY="
									"--outfile datafile --out json": "ZSOJOGr6NrTS84GxYVU+rNUJkMEZesuIa619DNQ33Lo="
									"--outfile json:datafile":       "gvAP+XzvnVbuYfTBmKYv39W/xfN+jDOPBzjIjWhv0RQ="
								}
								multi_step: {
									hash:       "TTD7A1LCQ6MJTQ55C97JIK7IR5NF1FBAA78DF8LLF22G0Q06D7R0===="
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
