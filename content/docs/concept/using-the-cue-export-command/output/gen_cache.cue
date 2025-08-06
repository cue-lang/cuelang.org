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
									"default output":             "RBfeX+dMQOdF7BpBkX5IxFXgR/daMCktLYKdjQb90sM="
									"stdout yaml":                "iF1fT4N3trNPtOgQvVcnzC5TysBmo4yf6399ScXBs1Q="
									"yaml:-":                     "Ji++LQpU8gLWJI9nCMH03BZjVhMNDynPf7moevbWJ8c="
									"--out cue":                  "1pbLTPcJTTzcRkIpDJBLE5cwdJouYB0zELJipSz2adQ="
									"--out cue no hidden fields": "SBiaOOAl4wJcQf4CGU/w3WR5t9vLBRzBOtHiYXydafE="
									"--out cue --package foo":    "17Ts9q/h+uwGHxSjfz9OXMbzF5/1Z7oAnRFtPzP4V4w="
									"--escape":                   "R9tZr43wLlHa/ow5bco7S5GciXl2iwx8ajJxLyThWd4="
								}
								upload: {
									"--outfile data.yml":            "92Hv2wK1yfI3jXJWh6UxbvnAvgUctmK2go++DBzBGK4="
									"--outfile data.txt":            "TFGghXQUeMKZflPidk6ICR/NdDB0bKg0PQ46/YuYJsU="
									"--outfile datafile --out json": "V9aRqTHKnsxh8bBqZOCiUJl0+7FMJmN69k+RoJmm/ME="
									"--outfile json:datafile":       "YFGqzdtx4+xxPFD2Nnb46BWfjXJdButj9ETSFZvkQu4="
								}
								multi_step: {
									hash:       "8J23G7BI4MRBO3KCC3H6SU13AQARBO5E5LFTGO6Q6T20CVBKB2Q0===="
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
