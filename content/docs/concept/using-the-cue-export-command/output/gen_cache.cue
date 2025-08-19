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
									"default output":             "SGqAh9QO8RBE0aBrmZ8pI2aR23FX6Yuo+mtYb3gZy7s="
									"stdout yaml":                "HXr5tIvjk3Xj+4sdP3Iy5wGokeOToLEgtz+/0iBY5zA="
									"yaml:-":                     "tWALUXPwm+eiVNG2DirFXZYJ6UtEcxu8eyY3tf5/bS0="
									"--out cue":                  "wbjIth44sYOUUDOWlcFRZ2TyxEFRiymfXeJdRFT0g5s="
									"--out cue no hidden fields": "vbknFuA+59/UL2NcvzVEGBFCyvyQlJOC78TTSOn5b/w="
									"--out cue --package foo":    "J4KWZ/E/LRHq1Ksb1U8Mp719XBPcolePp8Nht0uVmp0="
									"--escape":                   "XKkRrXOryuK7JKb73+zCAKfjAPWVxmFLYwgbHG3S9oU="
								}
								upload: {
									"--outfile data.yml":            "cHhsLWmhkGGlmVFxTwwyF4wMDwEEjnhjEBwCBNBTNGk="
									"--outfile data.txt":            "Q30uzHhY4eJQXbYQSLVkMsfkkwqjoXlb7qJI1MSic9o="
									"--outfile datafile --out json": "xP2OqMIprd+uBHBU4HIrhiKp93HRZwsEdPyyFDAeIkY="
									"--outfile json:datafile":       "EPDUOYiOKxd/tYp83ZaanpecwyIAx6aYZyCnYJUB6bI="
								}
								multi_step: {
									hash:       "5T2DQMKDE5TJBV6JNK6QG1O1FC08Q3NED9NJ3O27FNCB74QCLI6G===="
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
