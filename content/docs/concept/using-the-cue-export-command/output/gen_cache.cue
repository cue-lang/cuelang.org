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
									"default output":             "Viinp+kmSOZYyUCHFaGnpFmHT37IYYPD3jDz8G4KMz8="
									"stdout yaml":                "wJhdRZgovo5IAhUFEQSgNepLiLlJIJbRgYkvQ87rFGg="
									"yaml:-":                     "GYg98W4wuKshP6J8LWFV6EOGT7RIwPmNJsAVVxEcjhE="
									"--out cue":                  "p3OtL3Guipxgy5dEZ2FKxmGHXcbxNOIbY9B7C1hStuw="
									"--out cue no hidden fields": "BfMc9TSB4tfJN/foWArTYelSqvDCU+PI8NzDKb+I+ZI="
									"--out cue --package foo":    "tUiRnD/9f858F/emMTjY0fxVvfxAryouc+ESddVNT1w="
									"--escape":                   "du5u+jkP7RMQmsAEiTFPv1ECL7rgHVhQai837Qn+U3Y="
								}
								upload: {
									"--outfile data.yml":            "gl6QuRSYnTYU2WqM1Xt7SAkXvB77LA/1kKgFx+7pMp0="
									"--outfile data.txt":            "FzWugTsV0Ybt9aEfyJNoRmyoloAif1ydVoNiwzKeMtQ="
									"--outfile datafile --out json": "0pOJx9AN8SMvHCctrFmR5DfI8/eskufeS7WjD42Bjv4="
									"--outfile json:datafile":       "x3g+tv3eLYiNVI7BUPnHDii7Ro9GkTM4XswOIxJCyQA="
								}
								multi_step: {
									hash:       "AHJ6M86G5IIHIQSSI3VI8HLH6RB5SMGO75OJODFCGHV9OU2GLJC0===="
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
