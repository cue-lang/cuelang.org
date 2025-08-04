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
									"default output":             "aQH20qto2IQUkwT5ucX0c6OOaeT3kcNcCGtUdk0gpPE="
									"stdout yaml":                "aYsa9zmxCny8/RHFj9Gl7oVB+lGSXTdwpNIzlxS5nI8="
									"yaml:-":                     "uJEMYkSKjwWLTWSvWn8KsROylfh/uNPjGocL3pTfAx4="
									"--out cue":                  "YvYxwvbSfy/knXK022di+Mw/qvfizkL3h11X0t3X4as="
									"--out cue no hidden fields": "oBoOsTfQY+4xGBikZhskLmuIl9Cq5UVrYK4xdRYIHt0="
									"--out cue --package foo":    "QMz+mMGj2Dz57jExep6eJzp8GNd28gQkVTJS6iG/jgQ="
									"--escape":                   "+5upLNc8/j77LmZyIIxmLX5xykR8gq3Pav1arYVWh7I="
								}
								upload: {
									"--outfile data.yml":            "CEM7L3GIWHXxbyJyLFIqyF9Q3J9Ov82yBWXnGUBTwCY="
									"--outfile data.txt":            "rhQSL/kUG/Xzzk5z0oc8y0yE8DIPwO8dMOuKTnEHDPs="
									"--outfile datafile --out json": "MAEDsVVi/W00OnR5GbZ6BajFowY/iAktuBf/ZEeHGX4="
									"--outfile json:datafile":       "A+QWpVXo17xMBIZm5035J0+XLvRTdRwGoB+0HhLPUus="
								}
								multi_step: {
									hash:       "SSM329U5AAA2AVL2JQDP0RL0IRQ7VGS2RB07CV62DIDUNAG8T5OG===="
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
