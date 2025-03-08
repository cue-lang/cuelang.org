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
									"default output":             "aukboJAZNnilrErrmNir9/BKgW1Cyzs3AHH/Vy9j8aE="
									"stdout yaml":                "cGWkNu6pf2zBmwBZ9MIhS3QdURJJNu6psBReBSfWXAc="
									"yaml:-":                     "jQ6r6zapvQHS3mTS65JH3NZT1gDHSh2E6G8BrtDd9qY="
									"--out cue":                  "n8wgZuaPYtKGALk64oY2YZcO0OVC3TUnP5/x341NxIU="
									"--out cue no hidden fields": "bLapqOHljJV9HF/GYmPz+To7ej951ftZbmXYhl+fFW8="
									"--out cue --package foo":    "Jn8rQbdA6JyRqpofIGPcGuajvghovNKAOFdjVIULiDY="
									"--escape":                   "F4glwYYG/OnuzbJ6bBmutSXllPzqCijbQDk2yh5rag4="
								}
								upload: {
									"--outfile data.yml":            "M2Q4wgOv8xrkorakqiROK7F3YAIqcCqmgMen1ou+kHE="
									"--outfile data.txt":            "hSJuvqUdnWZjQp/qlRQfT5OBxrcyUJiNrEG4WBAA/+o="
									"--outfile datafile --out json": "N9/UKuJBcYAkIaF3nQ4DnuskRuCEBUdLa+EKNmkcWPQ="
									"--outfile json:datafile":       "wG1ZxMP/v0uDcyYKjVOUlwdazzAx0V4aWlmDYVkAnHY="
								}
								multi_step: {
									hash:       "2I2O8UNQGH7H1GSMT7A33LJLV34EVGC89OII2RCOJURQS4S0A3B0===="
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
