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
									"default output":             "MVpnY8WZ3+52Ah/aABvYHNiz3XC4p9alFBvlqHVFV8s="
									"stdout yaml":                "VqN0YHVvIPx3PV+Gxpfs9gXuseTYMfeFqXfWCotBL7o="
									"yaml:-":                     "81GeGf7QCeL0L3z+Bxr+b2RURz1rAqfICwGpDzCIjvY="
									"--out cue":                  "bMaHSwpUo8PmucPnZRlHwE90NR0sJPjbJ+U87P0B508="
									"--out cue no hidden fields": "4/rGupWkc7gfsAMx3G4HC5jhA4PPyboHJxn486tLSSA="
									"--out cue --package foo":    "htutYVtIsj127pACFbR8J/gt+HSaF0xwKL2b+KNEqRM="
									"--escape":                   "/QFnXl5y3yNrnrA216hB8ghk8b7xyBkwUjYDbqamaHI="
								}
								upload: {
									"--outfile data.yml":            "Ilj+1nw2sToUyBUui8/fAudIyTFLRx5XvJJC4XDpaas="
									"--outfile data.txt":            "YQNCpMtcyba2Y5rIAzBYPkNATFSzseBRs1HSf6gTPOc="
									"--outfile datafile --out json": "3K8LV08ogP0hZQvs5xTDD5vc2Wq9P4Pf5KZ0PMBa3X0="
									"--outfile json:datafile":       "pWGaW9osDCF2u8xt+aRWODu+pSwTHjqI3L4qhD/cn0w="
								}
								multi_step: {
									hash:       "9K870PT91K4K3R38K8U6V5QQ2A79IIOISRD4GACPLUHOVL5J9VFG===="
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
