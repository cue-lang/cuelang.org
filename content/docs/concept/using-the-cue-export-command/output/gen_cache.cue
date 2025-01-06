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
									"default output":             "Fq7cyzjxMMwd7v1HDqA6LwjhED1EsAEpl3eH56FhX38="
									"stdout yaml":                "8KXoDRUuM4E9Rojrw18zmQYsC6kzgZm3nGmQmamsVeI="
									"yaml:-":                     "lBErNR4NyQorWEzZFMMsjFlIKiqddNZVGEaoaHkCxDo="
									"--out cue":                  "+SIq60SHJEt5pafcdVmV//Dsks3XFjia63uQhz8MTvE="
									"--out cue no hidden fields": "JaNCnhonrWeexnkHGi82cOTd7YHAJujEpKdiIOUofYg="
									"--out cue --package foo":    "u6sRrefluttjF147eB0qTvCJ0GH6EzdZ1upDGpAhZ+U="
									"--escape":                   "bwpf8UkSkITleqCUOke8pV9LwTYEODEW5qBBJdB208Y="
								}
								upload: {
									"--outfile data.yml":            "n7eOx1EHQowZmkXcDHxYeBM0PjerSvLYWyZ86EIMl8Y="
									"--outfile data.txt":            "mfDOdoXlnO1ORTfx8EeKwzVq8SDTkzUjkZUhp7o48BI="
									"--outfile datafile --out json": "M2ytPh4Zih9WXEbuoWdP6lD4uaIk0eZlwAnrAkrhZOQ="
									"--outfile json:datafile":       "RWzJpI96FQqLIIsukylo6zvsK+wFl+DLgJNEArXkB60="
								}
								multi_step: {
									hash:       "5CLQ6738RISO748US9FPC1NVIN8GISIVLKH7JDCGJ36QQ7JUB7B0===="
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
