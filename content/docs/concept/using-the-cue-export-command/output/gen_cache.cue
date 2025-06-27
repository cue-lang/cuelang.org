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
									"default output":             "7l+SndqdnQedFnUEAgfT7XtFgiJzFYkM+uUk2tI+j3w="
									"stdout yaml":                "0RgW2F6Kmq7EhHB4rOXPwHlRl+XitfB46xCNbHw/a58="
									"yaml:-":                     "poaHaUx236f7MKnbeFK4eNLBQtt+mH/TjJuKu7koswg="
									"--out cue":                  "YuFqjDBdYAaNHkKO0bJ8EmC0tDxO2waloPgDayrE508="
									"--out cue no hidden fields": "ui4u3+7uKK09QG5eHBxpl1aIeEyp2o7bX0PVN8l0LO4="
									"--out cue --package foo":    "uwuhCYKk/OI7TSL3VU2mevgg7lQHV1/Ga4nv77/Bjy4="
									"--escape":                   "u1jheFdCpGSsQrIxRtcBCV/jk8vTEziNKf4IAAnBAh0="
								}
								upload: {
									"--outfile data.yml":            "mucbdRKx/5NDKBSfqy/wkD15/Z1eI/I9y3JpWG6IPDM="
									"--outfile data.txt":            "SdYZcdRs4xFHsHruhgn0PJ418JZGCdkKjiAF7HeGAAA="
									"--outfile datafile --out json": "pxaNaxCh577UBZ6t/uqegAv/86oQ5wEgrGfpEfcGZ5o="
									"--outfile json:datafile":       "260/Yj0dyw7XpUs3p13RtbTeNHiRx0BsKHxIvZpQK/M="
								}
								multi_step: {
									hash:       "B3OEKNU32IKJRUE25E8BQDS6DT4G11RETL9FPV8IBVBK7NI0ES3G===="
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
