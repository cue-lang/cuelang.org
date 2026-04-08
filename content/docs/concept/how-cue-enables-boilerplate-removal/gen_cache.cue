package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "oMgwrACTxSbn++SHWU9FsDqM/OndZADreH15V2v6N/U="
							}
							upload: {
								"baseline input":   "5ef8AVx0PnKVX5IdjUONJrPmsbNpTWzjSg+o3YiqbFk="
								"baseline output":  "hsdtL2FyJLaJJpYHbH94AZEbzMtMeQsv7YZSGWg547I="
								schema:             "59OFepudDxQVzENsj4Z3VFRlmSTBcy1G+XyJxfBdK4I="
								"schema reupload":  "FoaPs6Zc1lQiDgMAEqZ9dIsYhQBqDX/A6xWkdK1gWA4="
								"schema output":    "KCgdSLa4UzBmAND3czE+3qY8+Ux0Ow5Y4+IAZTS5Kjs="
								defaults:           "0BL+cWZc5BKfl3pKquu2KtZnOsAlJLtoy9g++zQg+Wk="
								"defaults output":  "Hrdigb0NL1CGUOZP0qQ1IazmYjqjc1n1FQTZBlFEIGs="
								name:               "4MsQ1MD4ZmcoyWUB7DPm3Qf0s+5xKEfEZBxH2uJZU0o="
								"name output":      "i4nvdqNKY4Um+hEQEY4OMqEubOLKKr0W6q6FRJQncg8="
								"extra app":        "eh7u8s7I6g8v1K1VnRExfa3BPCzKeJzoxATiQcEfwhQ="
								"extra app output": "j+9c7fny6O21IZ1FLlIuQsX2nSn3b6Oa9s6tJpNxrIE="
								"pre-trim source":  "IkGy0kQ8QEplcZyP5tI95oQQco9czRJn6E7KJE2PrSY="
								"post-trim alpha":  "NRvqZp5YHjHYXIMBk6h9ZBI5ZhKePM441EYkewFMEfU="
								"post-trim beta":   "YAqyabbZpLCpobNsGhoG3tT1vsjA5PhPM+4Qj3umkQU="
								"post-trim gamma":  "u3s++OwWkraQl1OwauSVq65mY6mVJ5bnzLawVIt0G6c="
								"post-trim output": "KiWsE7TQG91+1Te8yHGiKQGnXMQVoq/lsUaW//vOBIw="
							}
							multi_step: {
								hash:       "7SA7JK1S94I9P66IUUS99KD0CQS2SQC1R7FAD8018NR3VF3MD3B0===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
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
