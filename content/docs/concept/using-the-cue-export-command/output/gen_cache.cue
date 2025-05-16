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
									"default output":             "Wd+dTMc560YSWFGu8PBLNThhVnbTSe0Y5lexTO7P27c="
									"stdout yaml":                "Tt7Yw1+MpvjipLYboi7mahlE9pUs5nUNJtMiM52IorU="
									"yaml:-":                     "4zVhFfGs4rWcN3CKbRqOdzbul1EnkcmzbCM9md/NzMk="
									"--out cue":                  "22ENjoJGeJFJU2G1KKe00ZXys4jVVsosst3TzeQGlZc="
									"--out cue no hidden fields": "DHCCgerDhGpXJR6Nzj5FsvFEAiBZlx2uk0qotBELLvo="
									"--out cue --package foo":    "qjyQfPxIsDLhaU/FxSmHGmCxqvOvvxOBZ/Ay/+0SPOk="
									"--escape":                   "oIHVgwekEzYh92BLG44bMcI5pbyPC0MBYjfz7BRN2H0="
								}
								upload: {
									"--outfile data.yml":            "0GsuVbg2bn79Iaz3AmMOWqkhv96Sz4SujwEQnFhED04="
									"--outfile data.txt":            "6+dG/xeGDo1kWTNKHctdMfwbqPAwkDYdTvvVBMdVOYI="
									"--outfile datafile --out json": "/BOllWc6MEPM+rwkjMEJlwEFd4jMa4Ivr/lhnQYR0ZQ="
									"--outfile json:datafile":       "Xov0W8L5JP3lDWIYiwIIBJJS/i0RTe0dZgqGbaMcQyM="
								}
								multi_step: {
									hash:       "VM4TMUMNGQSPAOIG37DJBPNU7MLTOPSR6PFU3AQ6ILEK4F9PJ68G===="
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
