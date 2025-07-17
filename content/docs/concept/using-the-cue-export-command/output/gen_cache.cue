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
									"default output":             "QDjOYSsqKs2bvgAX2HOTpVNXKQ/pPg3LaJDP8D2Wkeg="
									"stdout yaml":                "mTX9PU63F134AjM0UtyqZ0dVSBBuwl9V3EKkErXf70M="
									"yaml:-":                     "AYzUvyZEacbN1WwX9+jo6Q1VHs8KMoax3lGf1+dDGk0="
									"--out cue":                  "Z3wplvy1QZBc2w24g+3Fp+QH31izCAjeJoFqivR6g2A="
									"--out cue no hidden fields": "WVJCbYRJ3ASs9zA8ENLazWETwygKkEpJBGRmckaWcI0="
									"--out cue --package foo":    "hSDp7WumpGHLbBz530NxSVIoWSS+nYKUlcL97ng32po="
									"--escape":                   "kN3yOuDBB7rjZvLWI4s2qMtuWrWndOTbNDiZ3HNKsv8="
								}
								upload: {
									"--outfile data.yml":            "446ZRoBRwy0w7M3QRGjknmmEmGz136RWhl0saDKtWIc="
									"--outfile data.txt":            "1/ImGDIOQLrAgefqswhe0It5hiW/W8ydBXRy3I1hY9k="
									"--outfile datafile --out json": "PChlwTJbkSwnzIpPjl+K/VooiYVN0w6sCjBD2OJillQ="
									"--outfile json:datafile":       "MjbatX1+QbrUjqFeM4LK/S26Ge/sjmfLKLW59D8G7P4="
								}
								multi_step: {
									hash:       "7BCPDVCQECCN528TM72QCDK4ITSP5IF13ICGBSJI1MJHJ26HL8OG===="
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
