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
									"default output":             "6RiwiLVle3K9Y+y81fChTjVepVM3S+axUeN+tYzZ0aw="
									"stdout yaml":                "BKmHGdixVIc6huJ8NqDFH8BDZ6DI9u9p9o9KRrF7lVs="
									"yaml:-":                     "p7Ibm5ndXZ7Plc7UamzsoE0OvumfjJGAn2dIoBC3gJY="
									"--out cue":                  "oxmxm61ZzAKtm+YUaT93/8/IVKFHNNeRJHbFWgR/a3Q="
									"--out cue no hidden fields": "7mOthG0pmSRA90vVFtY26cvAs4T+LhJyTpznT20KR7k="
									"--out cue --package foo":    "GJWHCOnVwtUWgR12A4grP6Z4gio0/eJtHUCSVgs05rE="
									"--escape":                   "6WwvZ3r9iE+woDrf/BjWiR07TtPYx/QunkA9IVEtcXM="
								}
								upload: {
									"--outfile data.yml":            "2D8QEVyIoF7kjuujjBRufE8gPqmtbC6/i4q6YnVHcS4="
									"--outfile data.txt":            "aV6Tr4yJodH9Qnn4C+rV2G856CnLyG+VlPoqvP9dvVU="
									"--outfile datafile --out json": "ZiI+vavWOfpdLoOq9Xat6u2vllgq2qZfjU/GRzJAmqc="
									"--outfile json:datafile":       "pXpqIE2857/44gRPPYr4bv6hE7bqG8up1hdJaA9LbFM="
								}
								multi_step: {
									hash:       "LAO8BAPG69UVNBAVO60AV37O4JOOVIBC6N30IJ0S67BM9U5UBHJG===="
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
