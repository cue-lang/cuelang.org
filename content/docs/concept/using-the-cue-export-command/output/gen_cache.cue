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
									"default output":             "Ypv6E+keQ1FvOGvApc1zd2UcXYxOAr1gNgdMuVxLw2M="
									"stdout yaml":                "t6rXNeAKsevzRYB1nQ+GdENI4hWojZSLnbuv50Jzr24="
									"yaml:-":                     "pJByvV/1jVhOoYJ1Ohp7LWT5CSt993t0ZvJ+dgjA2e0="
									"--out cue":                  "jIOiH8/ivSJDpX1jPhKG/bKvR11ZFpLq9luato49u/Y="
									"--out cue no hidden fields": "ZDkgxEPQGbrJ0DoRP9n9NLmXzwmUx33jhXTcOXy6fmU="
									"--out cue --package foo":    "MThI3A8gq3Z2wrHX2PGPTzY1mAQ+Cu3tL1f2V4DxqfA="
									"--escape":                   "SodlKFeRCRP2EXaQWpmgAbHrnXb/RHg1iKqkSNwqPAw="
								}
								upload: {
									"--outfile data.yml":            "FzudpOCgh0SATh0C2U56LoP2UELywy/nYiayrfJ47U4="
									"--outfile data.txt":            "IlsvEJeSkzwVfUbKNHRgDlxGCDUa6MLLqQASVRhJyIQ="
									"--outfile datafile --out json": "9aPR9HX/5whyVoF1F5VbNS0TXl/FRsmjVwdd+oSB1XI="
									"--outfile json:datafile":       "aJAxKfB06blNDgvDaLvj955JI4BAWn1b5V665OjtfkQ="
								}
								multi_step: {
									hash:       "U24U23F3V87VAUGJ97RHH5U2U2QI3Q011V0P1CUDK4LFJO1U54BG===="
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
