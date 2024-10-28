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
									"default output":             "4AQv/d7/oYwJN1M3c8ifIy4NPAzDEqSfpRnidAfj5rA="
									"stdout yaml":                "sAxgFF7HzlvxstLAMjdPJ+zXeel9SKTTVhEAjbdAc7A="
									"yaml:-":                     "oQCMwFsI+2UaVdxDovMGlsAfwYGKAyiINgnwox4f+6Y="
									"--out cue":                  "88HnObZYNqC/iv/GqE9IpNQjJ4defPRlBPCwuv78Qdk="
									"--out cue no hidden fields": "HQtnGOzQhHR1raE5xq/Awhp0s+RoQHHcAknGlL/R3dk="
									"--out cue --package foo":    "WTk20URfpKuAqt5M7MkRcjaQ1zsbU6rFjXOlPlNG3cA="
									"--escape":                   "y2VH+CBqtQjL5pa78A4xJOGTEFuLOvS2+EguJ8HnMqs="
								}
								upload: {
									"--outfile data.yml":            "lL1k7houfPpC1rRydvQQUKSjTOf+YxK9Vwv9kQuYGGk="
									"--outfile data.txt":            "qeGfhKOj5yfcR/HZUe4q3byes9r+71OnqougJdjRH78="
									"--outfile datafile --out json": "fB+UzORXNk3d4oFLH6yuKnX1Buy1TfXE6ytJvswmzL0="
									"--outfile json:datafile":       "N+mN5Vswq58lJNMULlC7Jeers5oXfaVaO+E/yqyrx3U="
								}
								multi_step: {
									hash:       "EDDCMS4EHJ31VIPOMGPELMMQQGED7OVJ0PCLS48JIRRMHVT63320===="
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
