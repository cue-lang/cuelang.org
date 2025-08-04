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
									"default output":             "0sLly0KCzw8EZtS4uBle19LPybTS5jzOIa3Z94NpAUI="
									"stdout yaml":                "KzYqYw/BvkIWyHjroysVAjcNYs4mKIyFP8GFOtuQsOY="
									"yaml:-":                     "5Y7aIUaOombaRHyi0boCKWRlK1IUP1rnNKT/xVyqZlI="
									"--out cue":                  "PAdQaTpBMdXjt3QSgxVCft4EYLCnCZZbuBI0p+MZIig="
									"--out cue no hidden fields": "LA5UQL1pnIU0GYs5tRsrY44LkKGVyaILZ1sbZURBQA0="
									"--out cue --package foo":    "YFMk1rdEjqE76RAtUai13xd4dCEeJtoGYNi9s5hKZFU="
									"--escape":                   "0haUvhgGQhbAxfyvEzZZVbva4Goz4c7L0MlhSgr/m04="
								}
								upload: {
									"--outfile data.yml":            "sTV/hUkZPy304UjCGqrbfMkCQVRvQ1e97WXcxO/1mAc="
									"--outfile data.txt":            "dZDHan7wFMcAG8WGC+RNBUqsEgJoF8jx6ywBKAAfyGs="
									"--outfile datafile --out json": "uwHer1FtluQaZrfHE71vrdjdKaUrWWMArX7b/bMQkxI="
									"--outfile json:datafile":       "n6+uMG0/alBqwsD+ikySXBBusIjJ00tfSvSlPMYFQdw="
								}
								multi_step: {
									hash:       "AH8T92169CV84UAL950N7G8VT5IPPQJG099TQ4J599EIV73VQV80===="
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
