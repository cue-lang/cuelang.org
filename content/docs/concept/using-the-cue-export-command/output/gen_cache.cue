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
									"default output":             "Tpc5/sHKdfWmGnnsKpTKLyyQIffEn9n0t0YAhjGPxBM="
									"stdout yaml":                "NmkNAXieMGjxVgGqO+rrcmGvQjFz9BySLWrkvY23toQ="
									"yaml:-":                     "pmhBP/vPJPID3ClZFvPm5pen1pKM8bbrtLZ3s+ERtaY="
									"--out cue":                  "Xy553cjsNCfrEP268kPEiROFNuJ2MWq1F+iAoTk1/Mc="
									"--out cue no hidden fields": "V8/t2AIk0jACgDVqwypH8FTeKLNn4dBwQR7MzX3A00U="
									"--out cue --package foo":    "kUR4mgqs2/2nYNibbRJbRQRJ3LklQvchMeNrEU0Fyg8="
									"--escape":                   "TrDLZwakSJVHPvCvhE8rO6pOvUGzJRd+/6gJXPnxPhE="
								}
								upload: {
									"--outfile data.yml":            "bSDa0qMCjMQ8lktTi8W2+GWuQTCVwwV2sjrt+u3JMZI="
									"--outfile data.txt":            "uVc/mYi7nX3gb2oyMgqNheaC7O4nL0Myt8uqKp7WHLA="
									"--outfile datafile --out json": "+Oh0/kbb3JV14GhPNcAeHTEo9y/DuDDWQ2YSYVd8Jj0="
									"--outfile json:datafile":       "sLFwXouHP7bUSj+6IRZM43uYD045iVn+Rb2+excItN8="
								}
								multi_step: {
									hash:       "QCIU5CIL9LB4NMQMFATHEVST2IKHT5EO4A9HADMG4E54N090CUG0===="
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
