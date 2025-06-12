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
									"default output":             "0CyyJo+Fha4Gm26P2CQpWLlpDEZQ9poALb+O+HMddU4="
									"stdout yaml":                "S7RYR5uNhCNipJc9Vr1yACsDXut8kHKCq0RQawhRltU="
									"yaml:-":                     "krCGMBjAJZzdEfJbri49sXyByejVFuzM/j4+7ZRd9vM="
									"--out cue":                  "g/5151QlJoQ47TeVeMTSRcuiCs5X6D2kUwggSVWJM9g="
									"--out cue no hidden fields": "dOvE6eqxsxa9Nf3shWNI2s0RI11ga+V6hGECV1Aw+Hs="
									"--out cue --package foo":    "T1AS5hlR1Km9qXidccEsR4gNN4EaoJKJ5YigHf9vAi0="
									"--escape":                   "HMjRb8yT1Aw3icbh5eVV2OU2Kl6thP4uCJ8NsFKwcKI="
								}
								upload: {
									"--outfile data.yml":            "dfB3J9VjCvfZR7Z8uAcf4KPK1Lzs6K+TEmKhT39WmJU="
									"--outfile data.txt":            "a4RfM3Bjh1syT4t5hy7EpuN911CtRXI7B3afClbr3yY="
									"--outfile datafile --out json": "9xPLVOuMa0o6/tKSAPxrctmDG1uoTKAC7+YEhtr46d8="
									"--outfile json:datafile":       "lRmjo6g3O/08b24HxLIRybyGs/RIxcARsbe+ZVkXFVo="
								}
								multi_step: {
									hash:       "62V2D4QO3JNFUIFVVBUMVBV39U1ACTP09HCVJP8MHMNFOTES4SMG===="
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
