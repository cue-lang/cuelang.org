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
									"default output":             "T1M+8qv/Zyj9oDowuiTG2CHeicqOp20hHg6FUlfC7zk="
									"stdout yaml":                "LqHbZVKKMunUZNOpfCytqRUsRbR7T0ozanr28Eo/CRU="
									"yaml:-":                     "FwEoktqHfYQC1xkS+/7tWsIRUcatNyv6pCO39KTtpCQ="
									"--out cue":                  "Kd05FSpgRwgVT/MygS9tDLo1Eqw/Am3XnqWTdLyF93U="
									"--out cue no hidden fields": "KWJSP8DKjB1ZJQ95eWBzz5pQXJf3BQnleGPCzXD/PBc="
									"--out cue --package foo":    "XVayDH6ekETD7Qx++u+3bB16wddqEwdkH9VkwKRrzEo="
									"--escape":                   "FC7kPg4+Z3qsC2LqIW2gk/WgzKW2tWuR1ywfrhnZt0M="
								}
								upload: {
									"--outfile data.yml":            "hYW93YRk6mMR9I9q5a7mPGbFKrtr7f+gFyDtoVy/bE0="
									"--outfile data.txt":            "RKCKTh9GwBWAdFKlqIYHVnQ+9T3f5hffCCFgzS6chzU="
									"--outfile datafile --out json": "CCW254kHPMG66d7pSwGi1HEKtsGn4AKhOiwcR5KLEqk="
									"--outfile json:datafile":       "kKSmlGE2DNK+R7W8cAJijUAH7rLhMdQxhpcbLSrloZM="
								}
								multi_step: {
									hash:       "4LUQPN8FPNBFAPOSELQ0M47FG37CDDMF66DQLHA6UFG031OTPUDG===="
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
