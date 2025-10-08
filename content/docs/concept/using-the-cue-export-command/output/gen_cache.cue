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
									"default output":             "c5qrVCaPgkZNNTG5wkHxTSw4jUsSqKAI++7zBD9iOBM="
									"stdout yaml":                "WfWWZLNASmoVPM7YNHwluNZoDV/BO/TKfjxgmBc93Zk="
									"yaml:-":                     "o6SeqeutB1s2GmmLceI4chTlwy3H608WGQax4IYUuc0="
									"--out cue":                  "y5rgmSoqp+fAhhaj6KjTGOHqdQBmIvGLV+zt3PDkBto="
									"--out cue no hidden fields": "hXvA3tH3dcUbTZySUIZv8lsqbysZoZ+R2isf2iumiHY="
									"--out cue --package foo":    "D36wVRsITY9eL85asWy8S998bfZuVaiV/UIEtl5xmu0="
									"--escape":                   "Vi0GQ53fC4XxhesQsrubXUVlRqsFionQ+EbffP1cF5M="
								}
								upload: {
									"--outfile data.yml":            "MGhhNksVD30hx6OzDUP42zALYcenLJhXC0i3qYOA7yA="
									"--outfile data.txt":            "ZaW8qK/MnSfl3Re4MjsnDq4TKTT/JnzG3PBIhY+i5cI="
									"--outfile datafile --out json": "DQhOx7izOdaaIIfvoZM3VR9p/lI2sNI68Yziknptzf4="
									"--outfile json:datafile":       "tyVSqsz7vQ0NTsHr2EGTNMLxk2AdlRy7WEmUkdA5ONU="
								}
								multi_step: {
									hash:       "AM3HHS55E708DQ0DEMRK68FL2HRIHI5NPVLF099JRCPEDH0H351G===="
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
