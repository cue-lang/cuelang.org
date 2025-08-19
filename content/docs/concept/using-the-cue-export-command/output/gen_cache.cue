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
									"default output":             "lt7ZBpIQSBUZo45neza54dhoD4oJegCUqlm9ZddmBAM="
									"stdout yaml":                "ezJ14XM1vstuH7mpZprFBRZ6/qynegCWAhA6QHYJN08="
									"yaml:-":                     "yWGn4Gzjg8MhD63YmLhw/bkHUI2qq2YnnLp7fF1N884="
									"--out cue":                  "MyJEs+AQbVtZbeVMqPA8mmWEc1nNQ7YpQIND1XCuzMc="
									"--out cue no hidden fields": "rXbwH0xKyFcIwU7xoMWpqS+4igdL/3YEeXCSRmLK2Cw="
									"--out cue --package foo":    "0GQOXVwhH+62upP4kjs0ejpqr8xob9MedixLnaYPgbs="
									"--escape":                   "9bmpqVnIqKWgMsx4IrvlHQTvSH893WtsSCTl7+Xj+oo="
								}
								upload: {
									"--outfile data.yml":            "kXD7krwOwEEwCkfKvvVMMq4JQd1+C2vVJse5twGhxmQ="
									"--outfile data.txt":            "mDgJl3bxWucMqx0G0G8Jvh6WCo2ddSzJ28nE6paBCWM="
									"--outfile datafile --out json": "n1VYsbwvTGnpAshiU0o5gv+L8FzsIUhr/q7uA6VQmwY="
									"--outfile json:datafile":       "YiJlALiWGhswz8DNvGVedFeitWPOBMMXHGakGfnUEYg="
								}
								multi_step: {
									hash:       "6FONQ65SHGKVEFTFEAVD11ILS46F0E4PD7AE0LKL19MESMSORQ0G===="
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
