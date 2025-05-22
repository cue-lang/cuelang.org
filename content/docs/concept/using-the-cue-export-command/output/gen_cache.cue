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
									"default output":             "hWBD1PGcAdLM/h8v3gmsQKtwim1UnPdYVm2wWEfbGJU="
									"stdout yaml":                "NsGH9S12hKxt02yX6u109+4FoUwGF3ntTl+KXBUTcQI="
									"yaml:-":                     "bhr/uM1ahY7zUOvn+FC8dsFd/NWCf2jMkSHVF+xgp+A="
									"--out cue":                  "k0OoHqJfWDJDey5mex7VaTU6/GZ+DVA9c+GPntFghLQ="
									"--out cue no hidden fields": "7LqNKfUamvhHum6FH+W1S35t2HLmdwK9wt5KMA+fu5U="
									"--out cue --package foo":    "8ieu4SYnwKrTeYeTJrtPZ8mToUmk72yypGTTKm55vQ0="
									"--escape":                   "PT4ISMkTyxr435LZzLGa1tL3RBjDUX/rcbSiIH3270o="
								}
								upload: {
									"--outfile data.yml":            "Tl4nsW94vtV2FXhrdEb7xEYl2E33uHhKENxxyRkuv4Y="
									"--outfile data.txt":            "8+iF+n23ZW+Fe0qoq5y2tfAryXSYEAr8F320mSH3+PI="
									"--outfile datafile --out json": "eQxrfffKQZlRlG8YPZJe2zHR/OeW81PPVK8zmP0y+7k="
									"--outfile json:datafile":       "Gfo64xLcix+oATOtaO48eljeZSz9mmuunpgRYiQhRuo="
								}
								multi_step: {
									hash:       "9PQS6AU9LU0UF3O2MH1SCD284CHT684HQU89MSH09FSITCCMKE00===="
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
