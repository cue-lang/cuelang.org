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
									"default output":             "qNiEYxh9V9J9NBzrxid7OOAqktrZS2PqNkVjUHSg7SA="
									"stdout yaml":                "OXDN1BgLS6IYllrnv1KeOO7jnO7s7oyxAh7xeQ9QSzs="
									"yaml:-":                     "CxvfPNCryTRpTGmIlmDPkSOkEP3sQFMvgxrR0VEOJYk="
									"--out cue":                  "RIWZyj5orsu+hQBgYtzxHPm8WlNuyBuNnlKb92S7wzk="
									"--out cue no hidden fields": "GH69sZzUNHIaUSsKoQ8gU4KrTvXGBo7BYeqlrdaSuJ8="
									"--out cue --package foo":    "ASIYY59Hh6G4FBgfOqaYViYqb95Z/4snK0n9h4PDFnI="
									"--escape":                   "xfV2g01XrEzba6eBDqL3Fo/gu5QQuLFQNe8imAl6QY4="
								}
								upload: {
									"--outfile data.yml":            "cd4sXL8J1+mjCixx4wL0vHfOJq0ekg/ZX9ifOPGeuMk="
									"--outfile data.txt":            "fWU8FPBmWkWk5EhdvvvdVPg3XAYs7smZ/z4A1HTZe88="
									"--outfile datafile --out json": "4xYIB7ApTn5gh6u1Sz6+iQGooNRzp44q3BY+yAK4LlM="
									"--outfile json:datafile":       "RrNrmm5xCl9RbH7tE1fUoF+ig9lrhFwC5Jpz+Fal9z0="
								}
								multi_step: {
									hash:       "LQEMING1KIK850S7N0UPC7BKRISU48UFIC1HGS376P82RCQ23QV0===="
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
