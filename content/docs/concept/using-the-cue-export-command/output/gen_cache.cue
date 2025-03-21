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
									"default output":             "eVmgKGN3mBYQ8DqcCtpxxpvinq4+vc57cysv0iwWeAk="
									"stdout yaml":                "W2oma1mchiiOmy3Lfa9K0AaS6Hr/H6ax5+g68Ska8yg="
									"yaml:-":                     "wF5Ol8aAVj0OY7L5s1xJut1db79F8Cue3LNScn8OtFE="
									"--out cue":                  "u8PrRC9blDmJW+FvG/+oa+J8cWSQAauY2tjLzIitRgQ="
									"--out cue no hidden fields": "FmWndfpLDmXoGxvcN2+TYG+buQ3typ/z7NLTD3Ed8UE="
									"--out cue --package foo":    "xa9yM9YK2h9tNY6teGPE11UqQk26wAMl8OUSjf1aSJo="
									"--escape":                   "KjBi9YXBdBsmHaUMX9fbv5vox/QwOT9RgY1oo4Wwmq4="
								}
								upload: {
									"--outfile data.yml":            "G5pButxb8nYvcHXkGiHGLxwQXOVMkzT7LlbM2jpJRP4="
									"--outfile data.txt":            "R3RkjCovQY66DGnB8pj8BszGyC9d44m1sDbZMKpi7Pw="
									"--outfile datafile --out json": "SviA30+0kqm2FZMppySqiQHsRAUF7WRz0LWh5+QyTOg="
									"--outfile json:datafile":       "byTkKrJ28yq431gRjl/So6UgxuspwN18QZ2gJ9w/shQ="
								}
								multi_step: {
									hash:       "VJNTIQ0M8HHVQA6D9S5HFR0DKKJH5VC1G82APRI8K7VP576BQS10===="
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
