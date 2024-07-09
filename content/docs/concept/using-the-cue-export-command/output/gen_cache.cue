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
									"default output":             "DsNw0J3bWDsyPaxzmQlH8KVfyNVDwUxTRjFfoVzkI1k="
									"stdout yaml":                "g/TcTgBXbZq5tXURiOhwsCJJho55WqB+VVArZlzexhA="
									"yaml:-":                     "TZFOTzW/wIRPyyELHtVEU7BAEyROmw8/4w3tMkhRhjo="
									"--out cue":                  "bl4RfKDMSoDsZ3/txLW2sRUsxlnaU6Exmx79raxz8Uk="
									"--out cue no hidden fields": "Ft5lByVKpf9fpv6/kDekzjAYWFcgaic/B3xFmLp3fJM="
									"--out cue --package foo":    "0+31C8y7J6jOzTeMRJR989+kP3tWV2LmA7eG5eHyyQk="
									"--escape":                   "NiZM0wArRNaOXiW0gJ9gcKMcgaIqvH22FqiKkWEToWg="
								}
								upload: {
									"--outfile data.yml":            "ul4qdtTnj/A6/955Sf6qtW/0Y890TMYoECXxgjiBX4w="
									"--outfile data.txt":            "DTdLjmrTqLTyeegF0SJzQD0mwBhomTtokGdd9dxksUs="
									"--outfile datafile --out json": "0+lLrxd0y054PON6zjeQKZQ/HHZBd5zFl2RzUI2nnHU="
									"--outfile json:datafile":       "o0FhwPTHj0noyqo/LJqdRtWX0hItocUXInHN/BoyfhI="
								}
								multi_step: {
									hash:       "S79FE1L4COIFD17S627ROP7J996PCIIRN00EOCNEPFIPVQF8BTMG===="
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
