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
									"default output":             "D13HAHdWf5iR2Vr6XiVTjAyZBcbItVYtIStC9lWWJXY="
									"stdout yaml":                "m7OVpNrqZlTo7X2gJkF2Sgl8/QEa6kpc0AaoAqcbXgM="
									"yaml:-":                     "hTtDaXza8UNUXtofSdipDbwsce7VPa4VEsOtJdPu9s8="
									"--out cue":                  "Za4k5juC9lTOY9jGQqykYByhTj3JzqwojYvwJ/hZBV0="
									"--out cue no hidden fields": "6vH8sWQ9eldrjl4YAteY57XoW7UhExlZHUUr0a7o5/U="
									"--out cue --package foo":    "xatc3Jwiel5l64YWF1zGNci9YHFrNhxrEyzeHrtuRkg="
									"--escape":                   "7b1PoDQg3Lz0CY6eh4TpNlEf9OpQgoyAEbfgNHomjnM="
								}
								upload: {
									"--outfile data.yml":            "l9gC0FmuuqH/3CTpmjK8L8AuOqe2prjY3zlwUKft4DA="
									"--outfile data.txt":            "xUMBh9eKTKykrT30TUNxDNZ0pyW31zi/xIBbfETI+Eg="
									"--outfile datafile --out json": "ioKmPq8rKQL4QA9829ZHqVMarJ0qzEV8Kl6/+R5xeok="
									"--outfile json:datafile":       "q6ooqOnKukL4+rIHHjns1aAPkX12qMoIVz9Kcgnic1w="
								}
								multi_step: {
									hash:       "CQ25HNKKDB4G4EE625CIPGVFQ107OHC902QF6L59DNDCG17T02FG===="
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
