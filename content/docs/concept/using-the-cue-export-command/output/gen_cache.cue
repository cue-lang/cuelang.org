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
									"default output":             "1TVojmaICup55zsP0JtjUn7elxmLtxYmehMdkctHQvU="
									"stdout yaml":                "m+W5dG4MkDIVP0CHKKh2L0gXrY2BfNsxyQX/fqV5xJs="
									"yaml:-":                     "5trcT2nEKwzq5ohrl6cc2A8zxpUO20iyshUQ+ZJODc0="
									"--out cue":                  "m6rfSkLYZYHk9ucU1TYUmC3rbdHMJ6iqc4fDDpssgFA="
									"--out cue no hidden fields": "2ahk9kt+CyBUUJPfe4ptFhzgTKs46UhR80AM6xsg0z8="
									"--out cue --package foo":    "XyXIwS15Ob/besYUU+R273y50kQ7Q1yHODJBjTr0tCY="
									"--escape":                   "zxuUe3ZI/rpkPX6wFcbOeVmOQB4iUS2bJ/0JJY5hZBY="
								}
								upload: {
									"--outfile data.yml":            "lZKRi1T+lQOLPelVXgVcL7DevnXpJgI40fNVTJrCr3c="
									"--outfile data.txt":            "2teKOREhRUtWaqhcV67RBc1RXLk7lIOtqXfCNJ2ou50="
									"--outfile datafile --out json": "9aSEgpYh8x1mAZm5WXp0RyqLlV7J3yHX7zCqIIMes/g="
									"--outfile json:datafile":       "Wa2wXknYtX9njQmOHLsBk4zeypuG3CtHKzCKf6sKI5Q="
								}
								multi_step: {
									hash:       "BMOM077688C7OU6ED08FDJ1D6JJFIKQDUUKOQ5GC4FB4N2TH3Q30===="
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
