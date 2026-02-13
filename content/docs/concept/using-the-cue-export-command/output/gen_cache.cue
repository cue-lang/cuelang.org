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
									"default output":             "VR462GOJpoJd/uv63Aoz9AkVdlnTg7ysaRITFAEi0wc="
									"stdout yaml":                "8iIUYPg6bh5FnOTY1MXuZ0F0sxKGI+NcB5COUoHcZZU="
									"yaml:-":                     "I7jbUbpAYgtuYC01/l4m7VMPWAy4xqHlTeJhqcNF/No="
									"--out cue":                  "64Emn+w4ebgF40pi40lR0SfsyJxDqSgUmj8j5k8x278="
									"--out cue no hidden fields": "0VfMLEnRIWRjYhPvmv+YpN3zxqJdPbX5lQKNWAHXzI4="
									"--out cue --package foo":    "q1Li47un2CwlC/wobkPpslK8V4mRw44+8MKLUKOGz9E="
									"--escape":                   "qkeszuqFTOPkJzcmH/jtwLSf1SJ4us0QZxOKiyVxYok="
								}
								upload: {
									"--outfile data.yml":            "ospM1HY5eV3j5ZkLYbMOB/viLoLJrZLATnQ0BvVrTm0="
									"--outfile data.txt":            "yyenj63wo0EAAPAoduG51zCjdJXO10JmUWFPOy1K43s="
									"--outfile datafile --out json": "b082HpYRtWp+t0TgTyIppo13q48bnOrA40k7PiLubw8="
									"--outfile json:datafile":       "XTNgyUs5sNsw8Tpa/AYESBhky1/lwbrwwIeVCH5UkXE="
								}
								multi_step: {
									hash:       "CN83F7SHV5Q98FIHTNTJNSC4MGLLM5RJKT4VL7ETPDQHMG8KQPOG===="
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
