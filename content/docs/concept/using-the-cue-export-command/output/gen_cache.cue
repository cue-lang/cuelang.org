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
									"default output":             "pTmGhqnvBq3bJKphZIKOamibbNLxBdEYrDI/5AFanSI="
									"stdout yaml":                "fHKYJkW18wQ7VwVaVkbp9AU2yHmixU/QZjuQY+oYiEQ="
									"yaml:-":                     "qMMywK9cAXd0pHm3jAfuENIVWTZCjjefFTugJ/NcMG0="
									"--out cue":                  "pVFRCnQH6yuNCGeLo46Rv8JwfW3zu70njQRj6OroJv0="
									"--out cue no hidden fields": "Si9nto33M9znqc2rXl4IGwa/Bexfir4k/L7q1h3rfXg="
									"--out cue --package foo":    "cCQBiiBF9dNbNsSFBbQynWFOvJzaFQjHJHbcAUGeu8U="
									"--escape":                   "WN2JiT1svxBBZb5I3ngv6+R+wqWfQ/WgNEOoWFVaBP8="
								}
								upload: {
									"--outfile data.yml":            "A9CUmi2H2ZcGYUsAbTvCqqmoAUXzXBdpq9v1Ui+eKYY="
									"--outfile data.txt":            "FEIqD/Vq+tdqNMgz1tilI5fU/cq9fF34n5ZZn6rroc4="
									"--outfile datafile --out json": "Qb2xLVUT4RFqGwL5EWgToa55cLFNM3u6v0mYEzR2gY4="
									"--outfile json:datafile":       "RLLzarSVTSr1q6NhVZwJZTYFloEJmaSHKOeBC5KlMB0="
								}
								multi_step: {
									hash:       "48F7LNFDBH5C2HQE7KQQ5GVQI7T35CC2GFTNNOD0EDQCKRJI59AG===="
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
