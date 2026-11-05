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
									"default output":             "woJyjO4R914XJ5fdHamQoBH5DtbZci/sXvGyQm6aCJs="
									"stdout yaml":                "vvvsCagXyameICmtoAte64a5KTlWjDJfMAVwau0FIHg="
									"yaml:-":                     "+BJtSOcXk9jtVkxh/r9IRkdoTef07iQGDrUok4i4dms="
									"--out cue":                  "xLRGI0qYlFZh8S1wonfwT6JYP46p1gz24lrjoSG7yfA="
									"--out cue no hidden fields": "OKnwl0fxsGNHAJL++XKlBPS6GU109EKc+R1cB6w07jA="
									"--out cue --package foo":    "vH3w/9YmDkEdAU0r2WHV7SN1x6FxhBc1NK36mug7fY8="
									"--escape":                   "mBkdElmrKGMu1q7hQu5TZOJcjTfBxP0xPzwhZ0JDCyo="
								}
								upload: {
									"--outfile data.yml":            "uUGRb2nRXB+0W36Ba2Q9727GtmKIUlEUWklanYnx0gQ="
									"--outfile data.txt":            "/W2ZSO8t+7RlVlFhs+hDrbdaMC8dDW8+cvDOynvehBM="
									"--outfile datafile --out json": "yaOcjdkxNcGkk70oxMTb5jxFJ1Hrg89qv7+STqp8Sb4="
									"--outfile json:datafile":       "XiNUP2tAltVZyU9Allqc3ng44HcP8t3RMcwbbb3yJQ0="
								}
								multi_step: {
									hash:       "B8K5CBTNGN85B9GA24VSIEKIL7DBE152BIDUKMG6REKPFQ9GDMHG===="
									scriptHash: "L3L2DKT4LCBOMUFUINT11UNJ16TU1DRUIO6VISUNUVFMT2O7KFM0===="
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
