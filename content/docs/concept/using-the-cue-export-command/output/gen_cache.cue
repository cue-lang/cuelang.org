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
									"default output":             "msScy0H8cWmw1s8EIHUwJIf0sL/DVm8DBgLDE7r9dXQ="
									"stdout yaml":                "AvQdykINheyPRADaR3Z6RGkm04l6vRtPgProU8OKJpg="
									"yaml:-":                     "uC019cL04pBzt1h4dEbCmkHzJite52MvJ25b+e56rZY="
									"--out cue":                  "hCrHnxQEDpzb+oMlMVotSOMkX4rnNBE2CavV5P+iS44="
									"--out cue no hidden fields": "GFjK++Hp9niO7qvrZKVIG2H3/68cWeoIOBVFLodzLsE="
									"--out cue --package foo":    "xz82V8HzfJC8NnNdRgvwhJPY+AjAYzSChdruukzYYlE="
									"--escape":                   "XikNg3Rq2PpQSOZl7EfvWXyvHU9ni2Zrh9dXNHV+5Kk="
								}
								upload: {
									"--outfile data.yml":            "nQ9YHXB9gw469kQVh2upHJttP2WuOIeo712PhErGXS8="
									"--outfile data.txt":            "VYxqOTyLrQOAaAgvzaaND31K3/FWiaUrShOagnCMj8s="
									"--outfile datafile --out json": "dyIPsNN/lfgK9+TkYm0IXDbrPLKFo6dz2w6iqTeEBDA="
									"--outfile json:datafile":       "ayFEFhnZ5KIhUyPcL4ihzXD0K8t9reP2vonG6Z+49nY="
								}
								multi_step: {
									hash:       "NVQCKTJ8MEFKEDU6AFMISJ261MO0U4TNMOEIUL47SDVQGTLSAQ4G===="
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
