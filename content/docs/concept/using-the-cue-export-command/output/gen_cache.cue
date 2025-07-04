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
									"default output":             "48pRLi3nhNQP3RPQ5EH8J7btytLD7+aXwcQzgfJwHz0="
									"stdout yaml":                "AHP+BdLLPs1aPq46VCP89BjsKPHxe+FxaWZyn1RbMTs="
									"yaml:-":                     "hJ4iLbuxptCy51aGOlSRkyxZXyCC9eH6J89FjaYTXU0="
									"--out cue":                  "A455ES7vxbTd/g2WB/9EyaM6rlnKpXxSp9iuMKVIXCI="
									"--out cue no hidden fields": "6/Alo/mGsYiB5BtevKmvf1fBBtB1a/hIWNpCAS2Qlhs="
									"--out cue --package foo":    "KV1Dd4yGlwfsFo0X5gKYZP+ZHms0UEgoGtpMOtmPLKU="
									"--escape":                   "9nir3s2joBhfBZbM2m9HpETKC6wE0QYLjMQVg3Xg9EQ="
								}
								upload: {
									"--outfile data.yml":            "Z+/PCHgp/abgH5CZAY1/BQwoOosacwAH47hB6lX5bc8="
									"--outfile data.txt":            "3/Gx8qZm/dm5imO4O2We70MY2yMY8qF7TrYznBBsuiA="
									"--outfile datafile --out json": "84bpjuIWYzPIY0oPs7bf5hDZzq9rZFoOFSEi4/Nf+yM="
									"--outfile json:datafile":       "FaXP/VNPnajrHYBJ0U9jD/U26sXZJhrTBrTl9eLIEJE="
								}
								multi_step: {
									hash:       "2STIHCIJU2I2CP6CEOHUV7EU4F148SJ3T1AM1UQI2LJIPDV7EDBG===="
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
