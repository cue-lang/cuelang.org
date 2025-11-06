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
									"default output":             "cRVJiFtcXtw+UoodxIiugSduQFVP1cACkg+OXPcIxaw="
									"stdout yaml":                "wSK2Y1R7MtLO+wyI0O1g+SWw6oDpI+Ub/hv6XmsBWRA="
									"yaml:-":                     "aQff40HnRcfpNY5AVVKKeX+aR/OxuGlQVNWbEFBccPA="
									"--out cue":                  "f+cBtbjEKtetdUksHwJIQBEipTIYeMerNpZm+Wezzbw="
									"--out cue no hidden fields": "jpgfbSzv5c0o4Oi0KrMiJdOXQlsfDNUooA0+1MtYCf0="
									"--out cue --package foo":    "AL5oCbgyoiOVvs6W+uoCpV51ftsJZPvRhVNcWjKVHxA="
									"--escape":                   "T++53SDkF+EBh7+zakAXQKK3D7+3j4Bfy3PWZuE32/8="
								}
								upload: {
									"--outfile data.yml":            "WmVVyUI2fg5/2MW/ckTyZSplrf0dmkzPoOU/p9l+CSw="
									"--outfile data.txt":            "sdf8h7EDUKLAAqRIjZOmO/fuV56w9/eCFGjVPk9i+Tg="
									"--outfile datafile --out json": "L1SZ9WFfagt1gWk0SQWlUkk6RNU0gnq2Z1mdn8eT+jA="
									"--outfile json:datafile":       "ssn1CLo42uvPqoVeUNgL60pYLb0hDFH86NRZvQFAwAo="
								}
								multi_step: {
									hash:       "SH7004ENG79BKMBFBAMDB307QJOCITT6L2EQRACQJGP209GD5BAG===="
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
