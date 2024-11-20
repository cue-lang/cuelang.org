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
									"default output":             "K0TdXbMrFNcZu3NZHomNU2yOwmcINNy9cWj16hVx9EM="
									"stdout yaml":                "q51BYo9NjCO5Sn6aarLA4ykCy+rbXZG/2LsxJ317SZk="
									"yaml:-":                     "6yccbWhtSDg2Hbt7BxFzTDSboXVpGKPPn/jCwKXvznk="
									"--out cue":                  "IeQJyOObGPMHUhCQAl3SBaESFVzxamuItF88y33wfyE="
									"--out cue no hidden fields": "pBNQs58AE4zMRb7MGjupvY6NNVijpcT5FQp+8wyF5TI="
									"--out cue --package foo":    "s0q9DcIs0NcJAFmR3MYHa0LkQgfth3oj9PZaeLyDEtM="
									"--escape":                   "zkmzaIkEidZjxAiRQbHdamo9xR5flxvZ7+7rju3fNLU="
								}
								upload: {
									"--outfile data.yml":            "R06xcgeT5WijfgAfeWmQx4bJYFEe9uiHR7YXy6ARRpM="
									"--outfile data.txt":            "LOu+GgtvBiLmDnEUgrGdYGLBWaJZ04D2MdWFP7cgLYo="
									"--outfile datafile --out json": "h9K5KA8Qga118rDepj7T4m/x/re8cSj06R/BpsvRPk0="
									"--outfile json:datafile":       "Zw6OXy1lgWZrj3BQZtViMLvlX6VW99j5nwOgG+lli7Q="
								}
								multi_step: {
									hash:       "B4HK03QP5L8F18Q0R682SMUQD687KDBFTRF4TB83DRCGLUN36EQG===="
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
