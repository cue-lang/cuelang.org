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
									"default output":             "+Qw5SWTyD4xSkRC3HW2pFSgHkfKpMlSZUZiqV6Mk0+U="
									"stdout yaml":                "ktgDJk2Y/5vZmM9nGN3Uibu8PlW/DfoFaOQ2HM3p4SM="
									"yaml:-":                     "f7Qcdon9AAuBa6OImkRZtHasbvpOxLAcCm2RWVR65FM="
									"--out cue":                  "Xv7cDgiURqT+D3haTQTB6OxtxQy4Ap0uaED+SK9b2Ug="
									"--out cue no hidden fields": "4179hAGjSGRLjha4qBqsv7qnNRpjcB4ewJogPjQO0QE="
									"--out cue --package foo":    "qghBZlwRwZnkLVWFLThZR5mMUS5vTCieXIBuY54kjWY="
									"--escape":                   "wyC5kqX+S0ZldLO0tAA0/nYPj2CuBd/4pnR6AUd9Ebw="
								}
								upload: {
									"--outfile data.yml":            "+Jb0ygWa17FY5vqZYA5bDSNoxvEzidk1ZxfXpj2OMiA="
									"--outfile data.txt":            "B/ucOAaSNyqn8rjHFw2WDFFNalOdBOmpQQrftenqHHo="
									"--outfile datafile --out json": "VInvbQ50eiFckHc6NCl5DbGe7PhtC0pkc0S9NDJ0VSc="
									"--outfile json:datafile":       "JO7f6XF8o4ryrIckK12M19VWlVJhBjIBZR6bJk3xa7o="
								}
								multi_step: {
									hash:       "HUL7RN1LGRTCSI3F5JVPRDOVNAU4RJESSGC0LV82U11J39US8140===="
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
