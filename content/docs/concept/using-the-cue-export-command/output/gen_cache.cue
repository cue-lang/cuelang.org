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
									"default output":             "wkbKFIXu02Q3I033WmC7eAN00HuCrg9rK8KYXVProY4="
									"stdout yaml":                "lCnCpdDIaTQrO9wLLO1RRq4Y+RJTiKNklD2HDQmntUo="
									"yaml:-":                     "CIjP+nwDe+wVp2Q/rS42/Hy1NcQC5oLcfnNm7mypAWg="
									"--out cue":                  "EpYCd/vW6SMTTF2foBDzTE6WUqWO9vHE5yxXFaM0UDs="
									"--out cue no hidden fields": "Mr3xqxAmLzaZ3L1JQe1/EdCLGEgd4KlWyXavZqgCCmE="
									"--out cue --package foo":    "0w5XEXbvjEGXLuvone2l+iMUqFoj1/5oFLPFQkvHCxk="
									"--escape":                   "Z9O/yte9l102wLHQwPX498odF0rCT0FbmdToEZHrx+E="
								}
								upload: {
									"--outfile data.yml":            "SRrhsjd6oABox/qH1unvENMbouyupENZHog5tZ7n4zk="
									"--outfile data.txt":            "XGTbNXFXwiZjkKTzdROVZZY6FvPAPi1VCcF7Ev+/XUk="
									"--outfile datafile --out json": "sbrksr3WtO/rk61xf88xGdRXLiS+oSUYoiyXFFFPj5E="
									"--outfile json:datafile":       "SmpL2CQpkh4JnqaLUPWtF2Bw3f/pCwUjqG3weEqyfEw="
								}
								multi_step: {
									hash:       "0OKMB4S75ACFKN4BQ3LFID693394LEGQKI1OGNS5N9L0GP4UJ5MG===="
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
