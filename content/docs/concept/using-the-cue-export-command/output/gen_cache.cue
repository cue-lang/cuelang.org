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
									"default output":             "W/EchVtxvONsnNDFqPFZo6YfJ1TnUEmolH9VnLrWsLM="
									"stdout yaml":                "xDsN2UkwbGYQT3fNbJHlrUT9pfDzkjSLO1PKz8M9rms="
									"yaml:-":                     "kG9BAIxe3iC5LszbqW3khjMdE9Izadn9BsqxcraKNIE="
									"--out cue":                  "gtRt0eI0Dub2INNUsqhY7IXaxKBkxmxljnLF7lRV3og="
									"--out cue no hidden fields": "Di6cYYZ+ZbLcKuXKboCsIPeRyQcss4UOhZ9MICjG+18="
									"--out cue --package foo":    "NJEpTj4c8qsCU6gvFYuVtZknuRQlkIH+n7JCXmW6OoA="
									"--escape":                   "Pfofj4O33xF3Sh6iLDYQ/zAp8zv0HjoXU0G6KX6FJ68="
								}
								upload: {
									"--outfile data.yml":            "0rYBjfPtmhoQzKh4YvaY4weo6J8Kg2ypg7UcwO/+ahY="
									"--outfile data.txt":            "MxEeINeuNAggNpo3Waz9cywYAbV77IWzj+TAKAGIMDE="
									"--outfile datafile --out json": "4raXxVcp04yWowl5gwB2ikpN4r2AYo5KfpGW9+wBz/Q="
									"--outfile json:datafile":       "xNNKbxlHsZX8bMdMeVcXHsOZ6H9coo1cP4h7Ptt7gY0="
								}
								multi_step: {
									hash:       "K6EHPMC5TCQA1M09ED32O5QNA4HAPCNKE9ERTUTPVBH9LF7U4JC0===="
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
