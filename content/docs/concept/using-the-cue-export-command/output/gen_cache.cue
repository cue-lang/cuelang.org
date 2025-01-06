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
									"default output":             "OSMKw1phURdSOM+tNnJcfNA+bC8mqTBBbaEl30z8WT4="
									"stdout yaml":                "URR6KblnBZcJiKNoex/o69qRCkxdEdOgoRISR53r5V4="
									"yaml:-":                     "N28CXhsYUZ4bLIskBNVkuQYNggK4Ce5RbqOBx29Ok7k="
									"--out cue":                  "w1d2pWpCLyO511FXG/Xf3FlGA67JiuIJfHwY+3HR630="
									"--out cue no hidden fields": "r1k7tvmND8l5trJQHOiFvrV5kxdGaGH77g9lnNlTBtQ="
									"--out cue --package foo":    "IxjtSR8anXG4+mOSeLOoWub2Wi3jfDLokQdp5snufac="
									"--escape":                   "b9pjpps5Y/jAFo2PowUJ+K2sqZiZjnhEXLz6SLxOXe0="
								}
								upload: {
									"--outfile data.yml":            "ObCvuZczWtJL53puExQmXKgrVWucsOeIoDMY0uVAlfI="
									"--outfile data.txt":            "3AxjmLFk137EtysfMEUhBWRtBBBpxP/ue5z0dKR6K7c="
									"--outfile datafile --out json": "ChC0Y4UmhF7RB0dQpddwu0Ta+FrP7Ug9giMJIgecQEM="
									"--outfile json:datafile":       "Qg2R583L8wY7T6xsAK2520cLcpmknzYSc14iV7AZJzc="
								}
								multi_step: {
									hash:       "4HLR4SH6PSPGL65E20F2BPPH4BR92CFMH6BEET798CDKN6VVRMBG===="
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
