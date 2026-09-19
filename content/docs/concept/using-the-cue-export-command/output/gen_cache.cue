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
									"default output":             "GYdI9iY62ySi/rYjwDeT59NXNCHWB0apivYK9Ev7pYg="
									"stdout yaml":                "HvMVt8uc9p9F3o6XI6IlN0TYScCPzmH1Yo1FrFxLW70="
									"yaml:-":                     "RbPlV29YB/cVGSMwvwLSmpJdo7lWE3SkopmdypuRVy8="
									"--out cue":                  "n5dI+Epd5nLbF0DlRQSynLzlvEihq7QaUeCxKf9oI1w="
									"--out cue no hidden fields": "+VQ7Fx7cX/qhsHSvnKemI9hxeLifo68PZFJbYsV7/4w="
									"--out cue --package foo":    "N6F0e7IeMWPrhOgZWyxX5qthWtj8Aej+1QSw+GOCp50="
									"--escape":                   "BLIRFsUpd3z50KCnpi4Z/TlsSaUYscUnjVKIHDjTMag="
								}
								upload: {
									"--outfile data.yml":            "TKv4ekb5/aBl/f9+5O8NWskpy31JKrM3JvVHTwj4L0o="
									"--outfile data.txt":            "AiQNTdfqSkaWZbN4KIk6djVVS3ZHDAi7hBrwtdXzdAM="
									"--outfile datafile --out json": "HvZpeMxH2TO21WO/pDZF5yg8X2lfbTCgkIBM53W6cZw="
									"--outfile json:datafile":       "ozps11AYuIbJkkMF2MDzjyig9GatM/jFULLvHeXFCFs="
								}
								multi_step: {
									hash:       "B74EJ14KA79H33N6D68S7I52U1EPGJ6RFO5DD47H50EO5IBE7S60===="
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
