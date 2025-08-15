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
									"default output":             "VYtmLGtq92jGSqYBe8pEOAjG/turpDhg6UWypj4rONo="
									"stdout yaml":                "eGgOF5zZzg+u4CthmARcgCOiSazAMV3slVS1WzgT7Ck="
									"yaml:-":                     "Qae3QlZtENCO/GGiSen6lgx3yLA/xbUtX3wJ21DWZ2k="
									"--out cue":                  "1880wzftJm8FdS4f6hX4zYhdSueY2J/EmAOflaAMIjs="
									"--out cue no hidden fields": "mhmTTkJ0EYBoYOWzsZcIffjZSqR4UOZ+hgysG+e5jwY="
									"--out cue --package foo":    "RQIjRg69ytXtwQdXGq9dTHFWYgUO4wl3uMh6TPLY0sA="
									"--escape":                   "M87A8vLk4fcs1aIM0qRprooUtJO/HohIgjUXmVN9ako="
								}
								upload: {
									"--outfile data.yml":            "1mdQ3pRCutRy70ECmq5bRPFGNKCtjzkNKcHKwBFyEmk="
									"--outfile data.txt":            "wTeqNDotBesTanXDZx1A5XRw38lkx8Z9pm31nzasSi4="
									"--outfile datafile --out json": "fcR5BJZhNBxS7PyuNG67y2sOQlHenBPZX/MojHXOOXc="
									"--outfile json:datafile":       "JTzTXQl2yAGRwaj46rp26ldI2twp2c0y4fShRYMgLng="
								}
								multi_step: {
									hash:       "IAF44ULVOJA059NRM42OIFH0TDVKBHGUFBBMV1MP7R4TG6DQDCJG===="
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
