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
									"default output":             "hZcoI5GBWb5ciVQMHIvSya9MHlqlqspJF7fB3XM9EKg="
									"stdout yaml":                "fF+8gThWhBo5pWgJcP6WelSZ84a/5ZMaEWX5IzLtbKs="
									"yaml:-":                     "DYQZRJV5nojGmemUfqWet/A5+m3XqGxljIUu3kpu9HQ="
									"--out cue":                  "i+Jsq72X0suEg4bAsIOcJCufxpY0PG8tWe9LR3Imbig="
									"--out cue no hidden fields": "UwwbhdqNEuser3wMwUUZLEhUt9Lt5XG77Ot8GizBU8A="
									"--out cue --package foo":    "h3/2G8Fy9UN1GSCRi3G1EW7pjwX04jVHNDJ0ft4AWdY="
									"--escape":                   "/YeYyB8i9IdyjH1cFtnbNFtM4d/f2AeS+aadtUSmKCc="
								}
								upload: {
									"--outfile data.yml":            "5S7/TJIWWtwWcOWm9WyarpOV+xE33DyouiWQsxFfUKw="
									"--outfile data.txt":            "dCkPQSyZhO+89vk6igmGFu6ke/9AOpkr1fso2p9rej8="
									"--outfile datafile --out json": "4yKoHS3Ch7CrjNV16ALbaQqz6HuIHPGaI9s7QRik9Rc="
									"--outfile json:datafile":       "wy1jEvpkHjx/dqzO8Arp+V5POCApChxMr2CJ/Hg/uGk="
								}
								multi_step: {
									hash:       "GIGRVNE4JF8UQIGSNIG9HF2VLM55DR2L6QQRD67QNN8NVPPH7HLG===="
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
