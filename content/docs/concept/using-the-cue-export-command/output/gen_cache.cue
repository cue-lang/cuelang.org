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
									"default output":             "4H+3H99W9S4QxXzXWwzpm++4H5oHBaW+PtZb12vps54="
									"stdout yaml":                "Fc0AjOcgjCTcGSjW6GqlI/AaBBO+cjtUPqFnR+oeJwA="
									"yaml:-":                     "IV5tBBfYvkQaoS1xp57QjJOGZ1lTI9aG7K1uHC1xtnA="
									"--out cue":                  "frEL2a/WU424X5p5ZvVIrVzoGPyYyEhVFTyxaF6WFcE="
									"--out cue no hidden fields": "Vrg79yLw/XGCKei6IBIDH7S9GMy306DowIozsgOCiU4="
									"--out cue --package foo":    "u1SnSN9umZ6VnReK2T8z4z8H02PTqB4E5X6YxrZbGZU="
									"--escape":                   "eXD7RsMygOlMs0uYRGchYuJ4xvWs4zkNibh409nwsII="
								}
								upload: {
									"--outfile data.yml":            "vVAh+MfIyjHfKTeuFNl1rm10yZC9UlJ2wA1oWEJJFSs="
									"--outfile data.txt":            "S4XGpXyXr7S/kbbLHCtyBqlkGH7/RODZWFvbI0HrTIc="
									"--outfile datafile --out json": "xeL+80emC1ws0toCfVATkSHT0vfF1SlH4Zi5yE7ksLE="
									"--outfile json:datafile":       "b/A/HJKEerkwFezakPrxx4wj0DFxWrTPBQlve3W3mS8="
								}
								multi_step: {
									hash:       "4I7SB4AEBMU7HL7SESC84AGL86HVFOUOMLMD6GBVA7HEJACKDQF0===="
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
