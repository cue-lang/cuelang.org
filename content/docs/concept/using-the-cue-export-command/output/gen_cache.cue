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
									"default output":             "EdL4EqjZoJZ2MtIhKUJ7r5EfC0ngQpXRiklmgSEEOPo="
									"stdout yaml":                "Pd3bjWkT1vCvjeZVY/26dpUyM1U8mKrfJ/Bo2zWg/o0="
									"yaml:-":                     "F1o1pxSFt0cUKYHNxOiKoMF7FsA5MyzaMjXvciIP/E0="
									"--out cue":                  "MKYhju7K+o7sjAxUJ0uVzktAAxetjrjyY453vkGU82c="
									"--out cue no hidden fields": "IqEzdPxaWSJogaCp7UKGRF9NLEFjk5zM9nS5pfdmGoA="
									"--out cue --package foo":    "NnIkzrIK5Fw221ICOhoF9BWxDIjJTqgaXCEaFnZ5TdQ="
									"--escape":                   "N9LTIly+BHR/1n7aUq/oQEGbYB+r0YTC5KX9bVSJ9mY="
								}
								upload: {
									"--outfile data.yml":            "Et5Zk9NkIbciLAjRMGr1tcMABCDClGZi9YwuXSzL1bU="
									"--outfile data.txt":            "1zFZgfEBZ2AKeB9/LGhKwejzmJhSzkk1g95VAb+17WE="
									"--outfile datafile --out json": "XYnT8skPd70D5Chhawq5Qf1gPZvSPRY93G8indH6+PU="
									"--outfile json:datafile":       "1L56kwbtxu6mFkedLkA7tAo3QaPJo2p2hv/lS6zhWp8="
								}
								multi_step: {
									hash:       "M77O5BNLLVVNPKM37SNUTV9QE72MGVR3BKAHVNVSKOMEAP72LOR0===="
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
