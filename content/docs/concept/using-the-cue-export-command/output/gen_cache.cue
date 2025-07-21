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
									"default output":             "TQ2KtK7BYya0nBfxxGX7kGSkZGTqMOIdtvWL3/wvWWM="
									"stdout yaml":                "E/oZPNb6vJAhZRacq2L+NWYWqHjzjHXqubF7e0bhMC8="
									"yaml:-":                     "0Btqcm4uwoGV18x/LBWBye9670tA2wG2RfjUBs7OlB4="
									"--out cue":                  "S1qe+fSiie1mgKBQAdIEQBnVh64ckclCx1zTjIHu3iU="
									"--out cue no hidden fields": "8HF74i7gy/Q/NekSrrbJt4hlV/kADY1rLjnuMU38QAA="
									"--out cue --package foo":    "pXVUxotUZv8NCPSiL3HMBcaC23B2LZ+T6dDo2Lmy0EQ="
									"--escape":                   "Nmu6U9a4AZJhLW9dW0h427KxOc9hOCkKXJHHfLfUo2g="
								}
								upload: {
									"--outfile data.yml":            "FNvdcm7S/OFB8BlzBX7PaL2UweQPooAZxS7vUioEaA0="
									"--outfile data.txt":            "289tGluR7AZkVXiH9f2n6RWXUBy4Jx7o/r+glwZ4yoc="
									"--outfile datafile --out json": "l+7LR/xYYVl318RmEWIhSVTaK8SNQ4XD52+9N3oPr9Q="
									"--outfile json:datafile":       "QjeWfqIGx1HHtahCdKFlXNY3SDWgncWFnkdpTTP34Is="
								}
								multi_step: {
									hash:       "LOTSREJLLHSGRA9J6SHREMKN1M1D1DP188J20VSTA4EU5QG12UT0===="
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
