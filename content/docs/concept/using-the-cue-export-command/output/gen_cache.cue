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
									"default output":             "kppPKgQjUXoj1ZoiP4YqCRBUHykXUcx+2e2lMQOZDHo="
									"stdout yaml":                "403ZavPRjkCVJcQhfcbU/kE88AONgbZD+kUXRpLzTlY="
									"yaml:-":                     "NXWb41YSDL01nfcPlS8Eslicv1o44urNbU41VcBU294="
									"--out cue":                  "qaX8EyWJLxyGQMftxvfJuy1kgm3zyfNJSGxC0KIZ/Pw="
									"--out cue no hidden fields": "YTllElPU8W023j6W99KP1xKzw2UhmU5nN99QP+TR+h0="
									"--out cue --package foo":    "wf/XidpwQmMdXt3xc3XcZE5UeuBnL+6+KZ65u0aQMVw="
									"--escape":                   "d/5YmslAjp+14sXw5nnqH0sX9dSUdJN8QyrT7LpIEP8="
								}
								upload: {
									"--outfile data.yml":            "h5pD/n1pwtv5g99oSxwh/Qb+u74NtTFRQmrlWLUPq64="
									"--outfile data.txt":            "iu9mqAYp3G6M/5f7gRkKIIq2pNjdWGSNm//cc5RIU0o="
									"--outfile datafile --out json": "PlgiuY6qwUm/VkYpMuHd6zm1QdI6Nm/T7BqaXVEIk94="
									"--outfile json:datafile":       "LH3D3zE8DppLCkLhTu+StNgB1AtP7s4ySMBLPjYQGv8="
								}
								multi_step: {
									hash:       "FD8CDB59JAQF2QE3E60H9CN96SBVHAGQV2FUJGHFUQJDEBU034H0===="
									scriptHash: "L3L2DKT4LCBOMUFUINT11UNJ16TU1DRUIO6VISUNUVFMT2O7KFM0===="
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
