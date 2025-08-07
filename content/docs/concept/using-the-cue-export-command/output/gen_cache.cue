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
									"default output":             "YF7rEUklsjSFZ80/EuQqTECpg2SD6DEojchECpMhfb8="
									"stdout yaml":                "WSfNA5N7gk2MAWrbg0ms57YT8lEfpv+puUwF4XV4XB0="
									"yaml:-":                     "/cJJBVdtZ2Edgc//oDGiyAcYQiWee1TK1OCyuudDiDI="
									"--out cue":                  "gejcRMJpyLDVujYR0WTw1xSDxdWpOvOv/PFToUfk1oY="
									"--out cue no hidden fields": "EOrGzdiI15FBuoVQmhjQmBMK6DyrKfj/1ZyZgVdDEKc="
									"--out cue --package foo":    "9S7HO3cW3tE6KP1mSBWJHEZToTbiRLP05LKe9GQSPP8="
									"--escape":                   "argW6HlU0Ecc5UrWsO/axr6ajJeATFGxwvgmjYEIIBM="
								}
								upload: {
									"--outfile data.yml":            "AGoCpzUXYmL3QjmBpWMgvE71CofGluAp1OEF862wkbY="
									"--outfile data.txt":            "hnUW3oDfS6vpcavnd8g1/V/qdgUVxGmVu2lXZeJhmdw="
									"--outfile datafile --out json": "0ANztoDtZcd419hnCtOgPFYpjE+g8tKm3Uev9XSf1Yo="
									"--outfile json:datafile":       "CHJrwd9zHBn0iQwY7u+H9peuu5x/M7N9VOAzXWJ8EO4="
								}
								multi_step: {
									hash:       "688GUP42H074O7DU2AJ5HV40SUD9JIELMC5GA9M3PS73CECRM8LG===="
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
