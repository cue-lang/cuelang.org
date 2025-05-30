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
									"default output":             "TomesRajrbEZURUX59A5EyxClnNOEXrt0QaZIzKdwJ8="
									"stdout yaml":                "dRC5B+0tHhYn5awo9LzL5GceHvn0CeLN+Xq++lsWKJE="
									"yaml:-":                     "mX6yOumjMCGU2XNoE62yST63LrmV27y9xgGmSVPKKhU="
									"--out cue":                  "RW24utVaZxtSihyptvorUVihhlzCDqHYF+xvJX3R+BQ="
									"--out cue no hidden fields": "gF5Xpx+tfC2GYvADv2y4Gm8aoOmrWe1SmVolj9hTeUg="
									"--out cue --package foo":    "F6ZeRQOGm3JywJN0Af5KD9E43ved3aeNCqP/1Vjs0kw="
									"--escape":                   "7g6pAWoX8DbbrQolWM1REBOf4kSFN/+6FIGO1bRbgFg="
								}
								upload: {
									"--outfile data.yml":            "8OplI7q7BQIq+cIY1/BzE5aFxL6Z+1RhVOr8WnGeIbc="
									"--outfile data.txt":            "y1bwRZsWR9FYnLP3dxds9D2dYnHpVJlvjLmSNrXcbFI="
									"--outfile datafile --out json": "auvEQHXBfwHhXo5WCuSBELqG90kTZYv359tjSO4sfjs="
									"--outfile json:datafile":       "LcIi2xt8z97mHiBZTv+B0nYY03OKHQQBBOjpBRiNneo="
								}
								multi_step: {
									hash:       "L9G8K392TA4RB7SAQPFR5RM7APJBV9O77NJ7APNL5U3UQO0ICVC0===="
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
