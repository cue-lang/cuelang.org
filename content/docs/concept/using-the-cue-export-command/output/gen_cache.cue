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
									"default output":             "Ulm8iKy3Zxjrt/qgOI8pMlHoGm21armYxV3L6bPrVuk="
									"stdout yaml":                "4c9l3BZ4QTLMp5+CCgFx9bnq9CAkiIjompknCFgws9I="
									"yaml:-":                     "povZcoSJmlktSmhrOcyTGnnjkFo5uIQqRVeG2uqQdtY="
									"--out cue":                  "ffcXdAhubv9wgvB+z0J4vPW92UXtJssv4ErLLvW/Tco="
									"--out cue no hidden fields": "jr0JBORqv5yF/heNkeRakXDP2Kx/qmb9fJ6m5fvgn0o="
									"--out cue --package foo":    "PowW++n/WNGxxc7ISRlxWjfxn4ltoGrY3OpIKdrxEOw="
									"--escape":                   "bNKhvG8NZ3g/Ev4CQez32ZFJSz+TAoltdnaBA/z6AA8="
								}
								upload: {
									"--outfile data.yml":            "jnJoN+gb/ZYLf00HjcQhXVs7GBekg+mmaKJ40oQtyko="
									"--outfile data.txt":            "NGQkCdpDjO0sLuFAC/ZdKZmwGyTeAhF1qcaP1W45rJI="
									"--outfile datafile --out json": "sZWS3da2HzePhPZhzq94J8LrPPZMbVKJwiS7gmzAOY0="
									"--outfile json:datafile":       "UahIxaoD0KsLi0vP3qiK23oW/IQOuMk6vSbR/1oXDmM="
								}
								multi_step: {
									hash:       "2VVD2TF0HVOK0NVI7644INI76KASCPVNS4UGTFU9T1N9E9GSPV10===="
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
