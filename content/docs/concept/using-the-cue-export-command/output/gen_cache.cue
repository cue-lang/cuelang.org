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
									"default output":             "jwquQffBoFjdqP42QCt3ofiN7FDLUK8dUCJItYeA7Hw="
									"stdout yaml":                "HUZsBLZOwYV+bum/FC8XZiNcMXlMkXrjDgVJZkWzYDM="
									"yaml:-":                     "c6CFTzqpH4JkVFUFoFCOuq8Rhzd2GyoQibwWwkd1shg="
									"--out cue":                  "ZGX8Vcr8mn7AmVdCOJj3Rzsbz4xedp1QyLgalEluGDk="
									"--out cue no hidden fields": "rK/MUu+J+Wvaa+2rd6H+rDo9ZfOUFFc/olNOB1UPmxo="
									"--out cue --package foo":    "duBwIr3QQ7kE3zZzmQC1NU2PqNDimYxu0SZw4cM3iL8="
									"--escape":                   "NkZ2gt6kExuXwW/1jgYTT9CwiCHG7J3XysxbSr9uZP8="
								}
								upload: {
									"--outfile data.yml":            "HHxrqCvO3EJxK1/txd4YqQlm2uOFsocFgbK64iFAyGs="
									"--outfile data.txt":            "sYL7A5gjrrGPCRrKeHZU2g+qgyIgwYuPRO0XfwiIym4="
									"--outfile datafile --out json": "9VzEYRlkQnL2Pcz/tUx737//eoIQjXrl+X1xTt1wHr0="
									"--outfile json:datafile":       "ARa/SdYgKlkhd8kD3sCzaj6EN8QAZKJKFbZMldBV6vg="
								}
								multi_step: {
									hash:       "A85PSSD5QQ49DEG41UDAH04R3RB358IES6J7ULMAM00I4G40CI1G===="
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
