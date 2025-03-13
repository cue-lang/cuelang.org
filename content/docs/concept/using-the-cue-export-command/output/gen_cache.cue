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
									"default output":             "9FDx8MeJUeP1Zo+3YUvDNmoo5zDZoQkjMMW8bVqtZG4="
									"stdout yaml":                "Kd5URQNOG0Dp56/nR+lCl2rIOlahKS7P5LDQrk7Dtko="
									"yaml:-":                     "BGEm1fBVf33qItIF8oWYSBFHmrIo6nnYxgZG7hOFtu8="
									"--out cue":                  "rgYrWQUngVc0f64X8nMdP+VNxq9Foul+KMS5RUVCVvU="
									"--out cue no hidden fields": "nPZtQpQK0hcoPb+/SYuNnd7mu7OiUJEdNw1YTtTf5js="
									"--out cue --package foo":    "UxEhZdqWOKheuF7F8Wd4aRlgulNxlu2CEEDkro9Pp+U="
									"--escape":                   "pQXwsZrGtMlm5p51YHf3R7uVVuILXdm2QMXezs/ogRo="
								}
								upload: {
									"--outfile data.yml":            "APyj9PHtyvNStBJw1vdvGZjlOAxnD3Nsbl4qEen9rF8="
									"--outfile data.txt":            "zlxx/ngTFfKJS76tR9xn4178ebI3ExtWSPesHiL7eqk="
									"--outfile datafile --out json": "toqo/j+8UvZcXcO78Ex0SiPt/3Y+R9sRxsEokd7jj04="
									"--outfile json:datafile":       "yfDtAtLQ632y9R90eBSIztU6Mt4O9SNmO/8BVMVQZRY="
								}
								multi_step: {
									hash:       "NLQE4N73VKO7IJA5NI4VGJLP80I5AE7RFK5OQB98REQN0EUP0LE0===="
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
