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
									"default output":             "uGInV7ZBdFmdkg56bNUAt9bZs4JMvWVHrnzjXtDYkLY="
									"stdout yaml":                "e91Rtr1ORbKp+sFaZB+vuEerZpc4gVL11ZCGHGI2uK8="
									"yaml:-":                     "gvpKFJoO99l1eXUh55Qmf9k65R8zfrQKYI5Erx02C4k="
									"--out cue":                  "BlIodQNXgpligFFgVhnW8HNtFRcqjNuQD5Kry04+9Ww="
									"--out cue no hidden fields": "67eT3MfB8o3ISjFAOs2cvuaf/ikav83zJZbKITGRqFs="
									"--out cue --package foo":    "qet+jxBH80w/8bBdbZeb3entoPfaNosOnNYVDqe11HE="
									"--escape":                   "buvmMHAFHSemI+hiykHXYNEoAg5I9yxXQHiobxw5QRs="
								}
								upload: {
									"--outfile data.yml":            "s+IfmFXy/dJAkT+lM02aH7uhSuqO/Hv9+srB75hAjI8="
									"--outfile data.txt":            "NmUDFP6ukgMIegZsc60L7gnM/Rm/len1qH23fbMui58="
									"--outfile datafile --out json": "UZz1kd9GWv1G+FD1/xmzFXx7Lzn/9fK331rKjj9/Djw="
									"--outfile json:datafile":       "FV5QiS16XTeG2nrzPh1M2gVOxgjrxMX2eISiyv99fNE="
								}
								multi_step: {
									hash:       "67UNF5NL4Q2TBBT3NECHA7B57LBNVLRDK8HJVDFFLQCG3FGFVSV0===="
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
