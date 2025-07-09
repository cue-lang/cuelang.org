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
									"default output":             "oFgUpuYiXNxKFzZUzw5I19pxEEdicAcf1KMz7A0+t5E="
									"stdout yaml":                "xD41Vs+G/ARjEMnSjVGi9IJuO0NHSQRSAsx3c4RIUJQ="
									"yaml:-":                     "DK0iPYPX+pZq+bMr6Nrm9vhLgddvtjJ+idj1iPyUufU="
									"--out cue":                  "9D3ZCviEk/QSnSfyr5VNHukfwOZ0q2Cu8yaQ1QwxQVA="
									"--out cue no hidden fields": "ptV+I8p5GQpd/j8PEc/3ayrN68qtf5e6ZNCsLOow/SA="
									"--out cue --package foo":    "tUb0nDEui5XVeqDnSmp62vpDeLlnGOIkyCvXzOGqhiY="
									"--escape":                   "CipogepTW/rtdkSSFpUGws0Vs0hZdwZWaLIBnzFY+bM="
								}
								upload: {
									"--outfile data.yml":            "7c+mkvdO3UsHJe9PJ7QPYfnkQVf54IBaqldGfTazsqw="
									"--outfile data.txt":            "6ow08ZOUqwnupHbyXaBoaOS53XIYpZrDOzlKLlbIBvY="
									"--outfile datafile --out json": "+2effCo13r0UlC5+3MTwGHciUX2AlehhGeR0KRuUok4="
									"--outfile json:datafile":       "6rFrXAsbvfmSx5hL/LMMjNyIBLvDJyqgxWDIoBr38do="
								}
								multi_step: {
									hash:       "E3PFILO77067KAJ9K6MASF4VDRME5MI2JBMN3PF4SE5AOT0276TG===="
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
