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
									"default output":             "5oNuhUcOFGQWgwQ5Syf46yzmqzXCusIWHWn4RCqUq08="
									"stdout yaml":                "LgCqj/hac3ZM9FEKPIfEykwOJQIYLOLOYLrZEp1NJdc="
									"yaml:-":                     "5h/JpAOxbMYIAd5m9hnIGSH8J7mr9XYyqJewNGICi3Q="
									"--out cue":                  "IEHnjT+ouV5/42ziOBENNcOxADOdJTiIKCxu71NEaks="
									"--out cue no hidden fields": "v/la+XEuWRFPgAT4rcQdnrF70jSCqONDuvhKDTRwdh4="
									"--out cue --package foo":    "0fTdeiK92M99cv2TpxEkDOQzfj0lh396nePcc7yTfsQ="
									"--escape":                   "PTw1XGp0ah4C8fMlAVyzB0yeTwoyS/+S35r5LQ6HJ8U="
								}
								upload: {
									"--outfile data.yml":            "c2e48SbUc6osMyIhtQK/xAnVWCPf4UBqsYvM5oj6qKQ="
									"--outfile data.txt":            "DF6BXt9cjfu2lV7vHLg20FtLogO2dCEb4iOcb6tvFoU="
									"--outfile datafile --out json": "Qj9nzpAJXI1OTNmqVXbGB9KmJfNkBssIoFOEzFoqTmQ="
									"--outfile json:datafile":       "K/p2u0Zb+56uR/8F2HcDpX/biJeEtoDpKscXS7+y0Cs="
								}
								multi_step: {
									hash:       "4O68GBLLDBFB2VUJD33GQCVH508H7OAJ2EUHS0UJLVVEE1MJE710===="
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
