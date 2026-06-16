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
									"default output":             "QXk1vpEGIYw6XsWtnraYqJQ61wCLptEd/xK/GK3cpBY="
									"stdout yaml":                "wMXhaG/BfurDxEyxPGdksn3Bis+mMVF67PMfMhLyJQM="
									"yaml:-":                     "m/OSmUV5Nw4XinV+oHtpmb2KLuwYEDLG45bREtBln64="
									"--out cue":                  "TxB7b2/ASH+j8hNDdS2ET2yqoOLk8m5ai3eKXINyOCs="
									"--out cue no hidden fields": "thgMUczlOhlKqDREPYXzbZIQcCE5RTdXcgQG0ZQOKXY="
									"--out cue --package foo":    "x2baFBwNaYvIGoMf5PinJo0XQOSplyOuc8YYmIbZyTE="
									"--escape":                   "F0KgNNXlqcXjXK5j2WmxJpblxSrtr8MDs++DGAz/5Pc="
								}
								upload: {
									"--outfile data.yml":            "+3ENC8KWloqNk9R5HSXcJgCbLQH1MPiC+psoaWtc8lQ="
									"--outfile data.txt":            "rmLPhat0s6GyU8z/xFhBS1Vbf43ebgsQHc1y1MVhKXM="
									"--outfile datafile --out json": "b5NMbwUrdL4559a3bwfeAjM8KhJZ5Y5J8WbT1189/x4="
									"--outfile json:datafile":       "wN5OwBRzlMCifY4ZtQg26t2vHQwWVqS5v6HuEjaEMag="
								}
								multi_step: {
									hash:       "NE230KGDLP9HV9IU167V4I8BGPPHR0EUGECS602O5I0BJ2EBR4Q0===="
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
