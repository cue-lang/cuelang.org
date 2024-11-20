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
									"default output":             "MScnYp/knqyKpbtnjtjOcBBoji3YwhCGwjQJcccx6EE="
									"stdout yaml":                "o7C0/6ZMQ/WYVDrPM4KXobi8GkgxotuwP6+O+7o9u+M="
									"yaml:-":                     "5HrLvXIi/x9ymR8jd8DoXs5FVKlDwHJpWKEYol0IkFM="
									"--out cue":                  "VtQnw6sHpv4Iot2qpTlqE0EMtUEonjD3q+XnW5V8j10="
									"--out cue no hidden fields": "dCKqi4FNcn95kskaaY1cr53XJ+GxRQXmoyBu9uMir+Y="
									"--out cue --package foo":    "LCeuuAHCJzY5dOMfcrVTAygVNcDpoX5x3y/34Hj913M="
									"--escape":                   "I0Szm/kQh3N8pQFlWMixtxOWg4sAvjS8asGhFSX0l1k="
								}
								upload: {
									"--outfile data.yml":            "g3bNFQfl0MTJZZH4rNcw2QkEzIUirx3LUFUMzLq+BS4="
									"--outfile data.txt":            "d/wSC9ZIvrz9BR8oT7z64FfaZZwujOIhE8L41fPtvzM="
									"--outfile datafile --out json": "HURo6RvsxpbhRosKn+9FP8KXAFp78GOe4V12gnD2htg="
									"--outfile json:datafile":       "9r6T+xyiI3FQ9nh2Oq5jALcsaTRqhp6CdrsFdFTgGd4="
								}
								multi_step: {
									hash:       "4TPKVRBEGI9R4I5L96H2N9JUKI1CHUFHH0C9TIUT9CVKNI1U1IBG===="
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
