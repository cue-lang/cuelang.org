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
									"default output":             "LcGuQxIgvRpB4KJriTVAwZefccNK8EQL6WbA6GUbr/w="
									"stdout yaml":                "/p9Op2rqcRwZDyiFH/cdpilk3aGn1+fUW6Zt7JTroSE="
									"yaml:-":                     "mG26n3QQ6+3HnLg7ccDxXIagAegEgzNo2dCRVdDMecs="
									"--out cue":                  "HQYnCEitUZBStsV6lW8altNagkynk0JS1fqB9C3BUfo="
									"--out cue no hidden fields": "5LdBwJNNf8+/GQVbgQ+rn1mnVG9KmiQQ4ysoH0tOhSY="
									"--out cue --package foo":    "xykIVgboyCPzmvd1l78YPACUZZGRDbnAY8YvW4VPyWU="
									"--escape":                   "1gYHOb4h9CViRREsrGNs8QpkGT+eakCHsDeqQcmOGwM="
								}
								upload: {
									"--outfile data.yml":            "3MyxbHQuUmvOqZN0T0J3v9pTVo1EdiRPMwTjF/cbpgk="
									"--outfile data.txt":            "LXJ9kWgTjFfNW4P6syjhrhFXvvv58ut2d+TK9ZCj3j4="
									"--outfile datafile --out json": "2AN/jHlyPVvpYIwHSyebViAzMCQZGCOTTLMrOgqIfug="
									"--outfile json:datafile":       "ZfD8NMbo21UqDjELfzQiZrucROOo8KqfL3RNeyy1sZA="
								}
								multi_step: {
									hash:       "279P2206A1BNQ0QG3E50LOS1LG5R4CM3TELTADSN7R77DTRTF17G===="
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
