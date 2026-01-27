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
									"default output":             "kcbUju2Fpk6NAc+XO3aHOS6BTDCO883e7NRjVJ2KeaA="
									"stdout yaml":                "35s5mCDaAK4c28EexBSxD2yohneWoZIkqz5V/K+yhls="
									"yaml:-":                     "qkzKeUQX3HAnWiOmkjiLBP09EeSp/Hu+UGFkd2TztbE="
									"--out cue":                  "iCJeozMMDzHdy2ZXvAuG3MCmg4eA4HXstqvMEdrHUUw="
									"--out cue no hidden fields": "1Ydlmg1GPxkjrnD+6XQm0qRKw4AlCzNYNm9MVdYY2zg="
									"--out cue --package foo":    "Sko8K5t6lVmMvQlSh5G8h4QNeErdiABDBP877WiSon4="
									"--escape":                   "+jHaIPJQD/V0Oiff6qc7NaQQnV4r+xSNWvQzdCKKD98="
								}
								upload: {
									"--outfile data.yml":            "K/1aEXQ9TsyopcLln6sdmQ2Tn/3IiyU/b+s9XYcwuzM="
									"--outfile data.txt":            "GCtXvKCj8pzLpO2AMEBRFF7CuHpxrSP/hP7BRxTuLUo="
									"--outfile datafile --out json": "MiHH7I5Ubghz/onH7lXGnK32D0TjPuW7hkrUwkcbyMY="
									"--outfile json:datafile":       "uA2h6bctEJGzdK3nGGiY/LCsv6pT7H27dVkOJaZFIRE="
								}
								multi_step: {
									hash:       "811R9CF4GSGNOT0M5UQDNLJ0333LALUUU16PM6KOK07MFR2O3JD0===="
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
