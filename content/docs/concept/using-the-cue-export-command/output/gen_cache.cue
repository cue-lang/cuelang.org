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
									"default output":             "VBQzHn1ZXtIzt/yqYD3nyPRlnEGdGaUaZo/ItNZMKt4="
									"stdout yaml":                "gXKt6UuhaOynWva2TbduQ63e7Cl8JMJX0pQbvQmINl4="
									"yaml:-":                     "ovSCeH5SULhVdlQoxipcBa054MAXzM9JwCRiT7DuEPw="
									"--out cue":                  "VlLOTfLiIF1hR22JmjnRP6ZsfLaOORO3lniHAxz75ng="
									"--out cue no hidden fields": "q65pk9Mk2q1rLDrmWx3XuOJE2qWV2jlXknG2BjfoWs4="
									"--out cue --package foo":    "nabLa0PjKMCyDw9on77x00mQgUUIWc8GiaW/ItZ8t9c="
									"--escape":                   "1LjvecIuSX1M+foAU4WOC/HlIk9LH3Z8u6w0vC0JvHc="
								}
								upload: {
									"--outfile data.yml":            "PYkI0Rt9lAtoXEJOABc44QvVRTf1oA6dfbtDjPSZKmE="
									"--outfile data.txt":            "8GGG2qVVIwHaw385iz3Y1vZxRWsiGeaqOB1WgEktozo="
									"--outfile datafile --out json": "haIQHJIvBYn6v0h7BkWS7wgcEJB9p8tUVL/o1IXWlk0="
									"--outfile json:datafile":       "PiDhsrEd0l/NKueEVQspEK5II35zZ0EH7Jw9wgy9j1k="
								}
								multi_step: {
									hash:       "JIS3QBOOEGCP7CDG2RK530FK8FB3HDFUG6IQBT8T9AJDOCQ26L50===="
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
