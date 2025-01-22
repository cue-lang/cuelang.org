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
									"default output":             "3p0a7Hwpk6SfkMo59ujI4Qj9cFlFbJzFONMo9tjxPvM="
									"stdout yaml":                "IagV/942lbvMnELnFWm6iJZLT/w97+UWBepN+twlBrs="
									"yaml:-":                     "uEhwWqa+NL1blE5lq9/Fiko7Jsho0FTdvJcZ6jdGIak="
									"--out cue":                  "LMKDir34ThzflhArLE1hRRMwW6HGg4qbMOp76ieGRFQ="
									"--out cue no hidden fields": "2UCrCHqFl2IbrejUJhy4pl7aNEOu7v9cJtvqm5Ror2E="
									"--out cue --package foo":    "lNJKkl8Wfske2h5kXsn3wJoUQD7astDgR1C8ww/Lk0g="
									"--escape":                   "GzpFZkZpGNuxLlaGfZCPxapKABMiCSIMdDqwRTVzyLo="
								}
								upload: {
									"--outfile data.yml":            "Jy12omSkdM7b1uY41Im4YS1m8a98L8o5Qe/byqJAA9g="
									"--outfile data.txt":            "fJOKH4naFyMSteInJV76p7pJfWp52gVHV6/9jxNrgRA="
									"--outfile datafile --out json": "+yx6H6ZSOSfsMJhAbZVa9QhKwADRYv2AFmnhS1SrVUo="
									"--outfile json:datafile":       "CgM6WO1q2xKew/i+87ji+Fa9lDrey9XtDpO6TgHMrAU="
								}
								multi_step: {
									hash:       "AE0FAJS9SPL6QE03QCMI4G0BUBDRRAIS8R0OQFUGT63EL0312DL0===="
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
