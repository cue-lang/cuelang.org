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
									"default output":             "Aaj/NVXrBmIkhHLoMGuV6r/vToaMeKSYnqwdP0xvNk8="
									"stdout yaml":                "aYm7QSi3CeJtvn7cK9WHLnj96YWa+JAE7JYbLP7xr7I="
									"yaml:-":                     "34rpAp7I6G3lgw9vkQm93HD4IxJ/4mngxPZBNtIPW04="
									"--out cue":                  "cFhxPELTM77grU+JmzkZMTrMsxpY7NXaqdtV5Fc7YFk="
									"--out cue no hidden fields": "Td0mzyT+vu5HcYA2EZ66MekkKhQqcIBG8VsX5wdr6PE="
									"--out cue --package foo":    "nxHBMR/J0TJraCP9qWW1ny3L4EAFwFIXt7sHOE3+eIg="
									"--escape":                   "R+eN89oZgYm/TC0yq/E2cFjoFPeFl1Sb8EvIA6nHtmw="
								}
								upload: {
									"--outfile data.yml":            "R0sMI+OhcKW4S8GWFpB7zKOh9Z7HI/1d80WrTHxJ7gg="
									"--outfile data.txt":            "VbFt6z1bLXpkR8DNBebHHPVbzisHK9qHzzH3c9YpJHQ="
									"--outfile datafile --out json": "TOVg122JTTRhU7XePTkmgrlYWNpvM1uLRSlcq6qMiwg="
									"--outfile json:datafile":       "QrwXL0iilZ/FaOeQKRA1b0RbPdwexp0awz5JfYwJQss="
								}
								multi_step: {
									hash:       "UV3ELUM8H1ENLHMU5P26URQTUUCQVU6HSA3SGEETL4ATIJI617BG===="
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
