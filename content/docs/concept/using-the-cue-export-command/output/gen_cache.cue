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
									"default output":             "hbgtZiyE+0XGaePpxehbvvz5Mr/v1QxK0w5Xb5jSDxU="
									"stdout yaml":                "RLqpIocEqvKB5ZzKPT0y8iJg3Q3mMs/eTqzSj6mv1iE="
									"yaml:-":                     "Oz9fK51+qmrvwuoxTnhKcbl9qhtSA0F4v4kwIuOeZsY="
									"--out cue":                  "l2mc9iaRIT/81ntlVOEGhWr8wWQiTW/XI6kl6ywVry8="
									"--out cue no hidden fields": "d/KeNnvIMRV7SDzPPA6vKCJCGROarHE0tiUYSmWFX9g="
									"--out cue --package foo":    "iK4MWBnaNIX2ka7T+yZKzx8B2rn9aDqGxNajzzBJ0zk="
									"--escape":                   "yOLgxsQ8hPHfKUTZv1z1OEMYVwFKEXRcOoowWsjAfFs="
								}
								upload: {
									"--outfile data.yml":            "+kmtJNETvrbvwgFlMEFjQJVehLVt1+2uU6JgUpHOieM="
									"--outfile data.txt":            "pMGd3AEpVSY80cUYM6Ah3c7cTLqkXtKnXlmnipkFzik="
									"--outfile datafile --out json": "oyRGae4kWsRkFXL5oMjkf8BJtwLK0Tu6tb2cKPMFCfA="
									"--outfile json:datafile":       "yamo/52lnPC77MLWm8GtBI8Cr66cyjL1w7Rz+FzpU+g="
								}
								multi_step: {
									hash:       "L9QG4K50FGR0K5HKN0N04DVBPOPKCN259N9Q1N9FI1NVU0DIOAO0===="
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
