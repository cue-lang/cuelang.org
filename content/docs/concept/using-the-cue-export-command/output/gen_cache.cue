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
									"default output":             "orzkV5cuWFIgrB3AbRw781UYkAukHxdEIh5PUECzpMo="
									"stdout yaml":                "dZY5Gs1Nj5k7gjY9kmoG49C7baMLOtCPMlWfhW5lfOc="
									"yaml:-":                     "fl75EIbBrWD4ygNRPtMiANJZ/JjTjZYHw+lRwy2mbGI="
									"--out cue":                  "sJLHXRa/7iAnEo3RJbv6sSS+4CD33KY3WGMHloUP5gk="
									"--out cue no hidden fields": "pjrysz4L7nS5b2cEn+pDu1V9qWroUVQJWMM4HRBzeT8="
									"--out cue --package foo":    "9X4uDpwRi8MNpEhBe/NRIV/F7HU6OL1Kr+rOvObo/MY="
									"--escape":                   "V80UZlxIUM5F2570IVNiolDxRWfIxcEAr1g+x4jYtDQ="
								}
								upload: {
									"--outfile data.yml":            "KsfcewhIuq5BBLxB895K27ICfeSSs7G39EM1nmTx/yI="
									"--outfile data.txt":            "1jonJAXjMeJskcMmcbi7kXpZDS66RuizgIR0uFhzggk="
									"--outfile datafile --out json": "LDAuy5sT5/N2yHC270DUZt5LydMq4QSNcO172orxHbU="
									"--outfile json:datafile":       "U97URESyhRNGH8v+tmP7RjCg7ZleysiZ3RS2fDrs0ho="
								}
								multi_step: {
									hash:       "A4551NLA4BKOQ70OG0VF2H2B9CJ4SALR6C0SRSM6C5E1LVNJV2E0===="
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
