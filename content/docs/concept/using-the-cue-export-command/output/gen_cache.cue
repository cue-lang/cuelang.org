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
									"default output":             "PMIQ2fXWu/JhZTTUTI2U4hF5UIVjB1NZOhvXQoYnNvI="
									"stdout yaml":                "8tsY795w3ZYWoeuZmqBn/UOGzn9HrOe86FzodLAs48k="
									"yaml:-":                     "BFvUyFdVQsUqLnaeAmckHfhO4ABcLnRpiO+1R4FW9qc="
									"--out cue":                  "sNWnqQ2DIALilYVmMomg22ZfvDaoQlt1L12TFoomojQ="
									"--out cue no hidden fields": "jmzB3sp5I4bILFgt7BNu9PDgR5khmCRud9LK25ms2W4="
									"--out cue --package foo":    "w39iydCLx7xxgTL4A1OsCWwbN7KIPVB5I2iGjj4qcPQ="
									"--escape":                   "oyksMiDibWGnrq1b+c3UUGEWkTEBO019L0hFGSGYGT4="
								}
								upload: {
									"--outfile data.yml":            "QmAGNrUcf6W0iSbF3gP5rrWubbeReqhsbnkBQQebbX4="
									"--outfile data.txt":            "B61EC/zM/Fy5ANQA6nGAx0qHbSzJcC7PAGdA3mAneJ4="
									"--outfile datafile --out json": "ahhYDgp7HCKcRvuj9aUBaCGLd/fu6Gu/2tMdRf2pVFA="
									"--outfile json:datafile":       "mYnGYenD9Y0g5Rn7xYQjf7lLLmfhKw45SVGvNde1d/w="
								}
								multi_step: {
									hash:       "VKKDNHIT5O8RPB3QCICN9H2AKPFQM69V9DF81BT6E15BEFQUBOA0===="
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
